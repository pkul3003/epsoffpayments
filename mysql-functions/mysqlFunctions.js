let mysql = require("mysql2/promise");
let config = require("../config.js");
let callmysqlpool = require("./createMysqlSingleton.js");

async function getConnectionPool() {
  try {
    return (await callmysqlpool.getPool());
  }
  catch (err) {
    console.log("Error in creating Mysql Pool");
    return false;
  }
}
