var crypto = require('crypto');
var _ = require('lodash');

module.exports = function(left, right){

    if(!right){
        var dimensions = left;
        left = dimensions.left;
        right = dimensions.right;
    }

    var compoundLookup = {
        left: {},
        right: {}
    };

    left.forEach(function(item){
        var keyHash = getKeysHash(item);
        compoundLookup.left[keyHash] = item;
    });

    right.forEach(function(item){
        var keyHash = getKeysHash(item);
        compoundLookup.right[keyHash] = item;
    });

    // var leftDiff = _.difference(_.keys(compoundLookup.left), _.keys(compoundLookup.right));
    // var rightDiff = _.difference(_.keys(compoundLookup.right), _.keys(compoundLookup.left)); 
    var diff = diffCompoundLookup(compoundLookup);
    return {
        compoundLookup: compoundLookup,
        leftDiff: diff.leftDiff,
        rightDiff: diff.rightDiff
    };
}

function getCompoundKey(obj, sep){
    sep = sep || '/';
    var keys = _.keys(obj);
    //keys.sort();
    var compoundKey = "";
    keys.forEach(function (k) {
        compoundKey += k + sep + obj[k] + sep; 
    });
    //console.log('Compound Key: ' + compoundKey);
    return compoundKey;
}

function getKeysHash(obj){
    return getCompoundKey(obj);
    //return getMd5Hash(getCompoundKey(obj));
}

function getMd5Hash(str){
    return crypto.createHash('md5').update(str).digest('hex');  
}

function diffCompoundLookup(compoundLookup){
    
    var diff = {
        leftDiff: diffHashesByKey(compoundLookup.left, compoundLookup.right),
        rightDiff: diffHashesByKey(compoundLookup.right, compoundLookup.left)
    }

    return diff;
}

function diffHashesByKey(hash1, hash2){
    var hash1Keys = _.keys(hash1);

    var hash1Diff = [];

    hash1Keys.forEach(function(key){
        if(!_.has(hash2, key)){

            hash1Diff.push(key);
        }
    });

    return hash1Diff;
}
