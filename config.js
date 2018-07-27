/**
Author: Parag
File name: config.js
Purpose: This is the master configuration file to define all configurations and properties
*/

let requestConfig = {
};

// Declare letiables for all reference lookup items
let DaysOfWeekNew = require('./reflookup/DaysOfWeek.js');
let ErrorMessagesNew = require('./reflookup/ErrorMessages.js');
// Get actual data (JSON objects) for each of the reference lookup item
let DaysOfWeek = DaysOfWeekNew.DaysOfWeek;
let ErrorMessages = ErrorMessagesNew.ErrorMessages;

let senderUsername = "pkul3003";

let mysqlUrl = "localhost";
let mysqlUser = "root";
let mysqlPassword = "root@123";
let mysqldb = "offpaydb";

let JSONObjects = require('./reflookup/JSONObjects.js');
let returnJsonObj = JSONObjects.returnJsonObj;

exports.requestConfig = requestConfig;
exports.ErrorMessages = ErrorMessages;
exports.DaysOfWeek = DaysOfWeek;
//exports.TwilioVoice = TwilioVoice;
exports.senderUsername = senderUsername;

exports.mysqldb = mysqldb;
exports.mysqlPassword = mysqlPassword;
exports.mysqlUser = mysqlUser;
exports.mysqlUrl = mysqlUrl;
exports.returnJsonObj = returnJsonObj;
