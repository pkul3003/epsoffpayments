/**
filename: router.js
description: this defines an  express application called app and acts as a router for all incoming REST requests
from the client. The use of body-parser is must to read the contents of the incoming request json object.

methods supported:
http GET, http POST, http login, http logout
*/
'use strict';
console.log('Entering router.js...');
var express = require('express');
var config = require('./config.js');
var cors = require('cors');
var app = express();
var bodyParser = require("body-parser");
var apiWalletController = require('./wallets/api/walletHandler.js');

// CORS-enabled for all origins!
app.use(cors());

var appRouter = function(app) {

app.get("/DaysOfWeek", function(req, res) {
	 var DaysOfWeek = config.DaysOfWeek;
	 res.send(DaysOfWeek);
});

// bodyParser for incoming json REST requests
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.post('/hook', async function(req, res) {
    console.log("inside router app.post/hook: "+ JSON.stringify(req.body.intentName));

		switch (req.body.intentName) {
			case 'update-wallet-balances':
				await apiWalletController.updateWalletBalances(req, res);
				break;
			default:
				var returnJsonObj = {
					"msgtype" : "info",
					"message" : "Invalid intentName specified"
				}
				res.send(returnJsonObj);
		}
});
}

module.exports = appRouter;
console.log('Exiting router.js...');
