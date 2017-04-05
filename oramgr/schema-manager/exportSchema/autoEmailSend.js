var fs = require('fs');
var app = {};
app.mandrill = require('mandrill-api/mandrill');
app.mandrill_client = new app.mandrill.Mandrill('qaed463QhEq7uQsyvQ5bVg');

var message = "DB Export " + (new Date()).toLocaleString();
subject = message;

var emails = [{
    email: "rpavez@teselagen.com",
    name: "Rodrigo Pavez",
    type: "to"
}];

var fileName = require('fs').readFileSync(__dirname+'/schemacode.txt').toString();

app.mandrill_client.messages.send({
    "message": {
        "html": message,
        "subject": subject,
        "from_email": "support@teselagen.com",
        "from_name": "teselagen.com",
        "to": emails,
        "headers": {
            "Reply-To": "support@teselagen.com"
        },
        "track_opens": true,
        "track_clicks": true,
        "tags": [
            ""
        ],
        "metadata": {
            "website": "www.teselagen.com"
        },
        "recipient_metadata": emails.map(function(e) {
            return {
                "rcpt": e.email
            };
        }),
        attachments: [{
            type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            name: fileName,
            content: new Buffer(fs.readFileSync(fileName, 'binary'), 'binary').toString('base64')
        }]
    },
    "async": false,
    "ip_pool": "teselagen.com"
}, function(result) {
    console.log("Email sent");
    console.log(result);
}, function(e) {
    console.log("Sending  email failed");
    console.log(e);
});
