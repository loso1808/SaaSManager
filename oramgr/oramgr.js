#! /usr/local/bin/node

process.on('SIGINT', function() {
  process.exit();
});


var program = require('commander');
var util = require('util');
var path = require('path');
var fse = require('fs-extra');
var inquirer = require('inquirer-promise');
var Promise = require('bluebird');
var crypto = require('crypto');
var _ = require('lodash');

var getConnInfo = require('./getConnInfo');
var generateSnapshot = require('./generateSnapshot');
var generateDimensions = require('./generate-dimensions');
var compareDimensions = require('./dimensional-compare.js');
var ToTable = require('table').default;

console.log("Oracle Manager for Peony");

function list(val){
    return val.split(',');
}

program.version('1.0.0')
       .command('diff [options] <outputFile>', 'Diff schemas')
       .command('sync [options] <jobFile>', 'Sync schemas')
       .parse(process.argv);

