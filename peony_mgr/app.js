
var util = require('util');

var express = require("express");
var app = express();
var path = require('path');
var passport = require('passport');
var LocalAuthStrategy = require('passport-local').Strategy;
var _ = require("lodash");

var log = function (message){
  console.log(message);  
};

var logErr = function (message, metaData){
  console.error(message);
  if(metaData)
    console.debug(util.inspect(metaData));  
};

var appConfig = {
    port: 2000,
    dbConfig: {
         client: "strong-oracle",
         connection: {
            "host": "localhost",
            "database": "ORCL",
            "password": "owner#0503",
            "user": "pnymgr_owner"
         },
         pool: {
             "min": 0,
             "max": 25
         }        
    }
}

var knex = require('knex')(appConfig.dbConfig);

//
// Implement this when we have time
// http://blog.robertonodi.me/node-authentication-series-email-and-password/
//

// Configure the local strategy for use by Passport.
//
// The local strategy require a `verify` function which receives the credentials
// (`username` and `password`) submitted by the user.  The function must verify
// that the password is correct and then invoke `cb` with a user object, which
// will be set at `req.user` in route handlers after authentication.
passport.use(
    'local-login',
    new LocalAuthStrategy(function(username, password, cb){
        knex.select('*')
            .from("USER")
            .where({USERNAME: username})
            .asCallback(function(err, rows){
                if(err) {
                    logErr("Error occurred while authenticating", err); 
                    return cb(err); 
                }
                if(rows.length === 0){ 
                    log("No user found when authenticating for username: " + username);
                    return cb(null, false); 
                }
                
                var user = rows[0];
                if(user.PASSWORD != password) { 
                    log("User with username " + username + " failed to authenticate because of an incorrect password.");
                    return cb(null, false); 
                }
                return cb(null, user); 
            });
    })
);

// Configure Passport authenticated session persistence.
//
// In order to restore authentication state across HTTP requests, Passport needs
// to serialize users into and deserialize users out of the session.  The
// typical implementation of this is as simple as supplying the user ID when
// serializing, and querying the user record by ID from the database when
// deserializing.
passport.serializeUser(function(user, cb) {
  cb(null, user.ID);
});

passport.deserializeUser(function(id, cb) {
  knex.select('*')
      .from("USER")
      .where({ID: id})
      .asCallback(function(err, rows){
         if(err) { return cb(err); }
         if(rows.length === 0) { return cb(new Error("User not found during deserialization! User ID: " + id)); }
         
         var user = rows[0];
         cb(null, user);
      });
});


//Setup session and body parsing
app.use(require('cookie-parser')());
app.use(require('body-parser').urlencoded({ extended: true }));
app.use(require('express-session')({ secret: 'stop sleeping in the rain', resave: false, saveUninitialized: false }));


// Initialize Passport and restore authentication state, if any, from the
// session.
app.use(passport.initialize());
app.use(passport.session());

//Set '/' to serve from public_root
app.use(express.static('public_root'));

app.get('/login', function(req, res){
   res.sendFile(path.join(__dirname, '/public_root/login.html')); 
});

var hashPasswordField = function(req, res, next){
    var passwordHasher = require('./server/hash-password.js');
    
    if(req.body.password){ 
        passwordHasher.hash(req.body.password, "Panic at the Disco", function(err, hashedPassword, salt){
           req.body.password = hashedPassword;
           next(); 
        });
    }else{
        next();
    }
};

app.post('/login', 
    hashPasswordField,
    passport.authenticate('local-login', { failureRedirect: '/login?msg=Invalid%20login%20credentials%21' }), 
    function(req, res){
       res.redirect("/index"); 
    }
);

var ensureAuthenticated = function(req, res, next){
    if(req.isAuthenticated()){
        return next();
    }else{
        res.redirect("/login");
    }
};
app.use('*', ensureAuthenticated);


app.get(['/', '/index'], function(req, res){
   res.sendFile(path.join(__dirname, 'client/index.html')); 
});

app.get('/api/client/', function(req, res){
   knex("CLIENT").select('*').orderBy("NAME")
   .then(function(results){
      _(results).forEach(function(item){
         item.PM2_NAME = "peony-app-" + item.CODE;
      });
      var pm2Mgr = require("./server/pm2-manager.js");
      pm2Mgr(results, function(err, mergedResults){
        res.send(mergedResults);           
      });
   });
});

app.post("/api/client/", function(req, res){
   var provisionNewClient = require("./server/db_setup/setup_client_lib.js");
   
   provisionNewClient(req.body.clientId, req.body.clientName, function(err, results){
      if(err){
          res.statusCode = 500;
          res.send({msg: err});   
      }else{
          res.statusCode = 200;
          res.send({msg: "Successfully created client " + req.clientName });
      }
   });
});

app.use("/client", express.static('client'));


app.listen(appConfig.port, function(){
    console.log("App listening on port " + appConfig.port);
})