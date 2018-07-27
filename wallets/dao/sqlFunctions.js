let mysql = require('mysql2');
let config = require("../../config.js");
let callmysqlpool = require("../../mysql-functions/createMysqlSingleton.js");
let SearchStringParsing = require("../../common-functions/commonFunctions.js");


async function getConnectionPool() {
  try {
    console.log("inside getConnectionPool...");
    return (await callmysqlpool.getPool());
  }
  catch (err) {
    console.log("Error in creating Mysql Pool");
    return false;
  }
}

async function updateWalletBalances(req) {
  console.log("Entering updateWalletBalances...");
  var Jsondata = req.body.transactions;

  for (count in Jsondata) {
    console.log(" from : " + Jsondata[count].from + " count = " + count);
    console.log(" to : " + Jsondata[count].to + " count = " + count);
    console.log(" amount : " + Jsondata[count].amount + " count = " + count);

    let fromquery = "update user_wallet set wallet_balance = wallet_balance - " + Jsondata[count].amount + " where wallet_id = '" +
                Jsondata[count].from + "' ;" ;
    console.log(" from query : " + fromquery);

    let toquery = "update user_wallet set wallet_balance = wallet_balance + " + Jsondata[count].amount + " where wallet_id = '" +
                Jsondata[count].to + "' ;" ;
    console.log(" to query : " + toquery);
    try {
        let pool = await getConnectionPool();
        let con = await pool.getConnection();
        await con.execute(fromquery);
        await con.execute(toquery);

    }
    catch(err) {
      console.log("Error ====== updateWalletBalances for record: " + count);
    }

  }
  var returnJsonObj = {
    "msgtype" : "success",
    "message": "wallet balances updated successfully"
  }
  return returnJsonObj;
}

exports.updateWalletBalances = updateWalletBalances;
