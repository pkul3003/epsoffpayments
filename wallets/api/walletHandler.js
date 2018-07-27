'use strict'
let stubResponse = require('../../responsestubs/StubResponse.js');
let config = require("../../config.js");
let globalsqlFunctions = require('../../mysql-functions/mysqlFunctions.js');
let mysqlFunctions = require('../dao/sqlFunctions.js');
var express = require('express');
var bodyParser = require("body-parser");

let restService = express();
restService.use(bodyParser.json());


async function updateWalletBalances(req,res){
	console.log("Entering updateWalletBalances========>");

    let response = await mysqlFunctions.updateWalletBalances(req);
    console.log("inside updateWalletBalances:  ", response);

		if (response === false) {
			var returnJsonObj = {
				"msgtype" : "error",
				"message": "There was an error is fetching customer"
			}
  	      console.log("Exiting updateWalletBalances========>");
			    res.send(returnJsonObj);
		}
  	console.log("Exiting updateWalletBalances========>");
		return res.json(response);
}

exports.updateWalletBalances = updateWalletBalances;
