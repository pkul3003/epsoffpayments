
async function getParsedSearchString(search_string) {

  var onlyLetters = /^[A-Za-z]+$/;
  var onlyNumbers = /^[0-9]+$/;
  var onlyMixOfAlphaNumeric = /^[0-9a-zA-Z]+$/;
  var returnJsonObj = [];

  var jsonSrchObject = {
    'tentFirstName1': '',
    'tentLastName1': '',
    'tentFirstName2': '',
    'tentLastName2': '',
    'mobile': '',
    'UHID': ''
  }

  //  let strArray = search_string.split(" ").map(item => item.trim());
    let strArray = search_string.split(" ");
    var icount = 0;
    for (i=0; i<strArray.length; i++) {
      if (strArray[i] === "") {
          continue;
      }
      console.log("Split array: ", i, " strArray[i]: ", strArray[i]);
      var letterCount = 0;
      if (onlyLetters.test(strArray[i])) {
        console.log("inside onlyLetters: contains only alphabets ", strArray[i]);
        if (letterCount === 0) {
          jsonSrchObject.tentFirstName1 = strArray[i];
          jsonSrchObject.tentLastName1 = strArray[i];
          letterCount++;
        }
        else {
          jsonSrchObject.tentFirstName2 = strArray[i];
          jsonSrchObject.tentLastName2 = strArray[i];
        }
        continue;
      }
      if (onlyNumbers.test(strArray[i])) {
        console.log("inside onlyNumbers: contains only number ", strArray[i]);
        if(strArray[i].length === 10) {
          jsonSrchObject.mobile = strArray[i];
          console.log("it may be a mobile number ", jsonSrchObject.mobile);
        }
        else if (strArray[i].length === 4) {
          jsonSrchObject.UHID = strArray[i];
          console.log("it may be UHID ", jsonSrchObject.UHID);
        }
        else {
          var invalidNumMsg = {
            "msgtype" : "failed",
            "message": "Please enter a valid 10 digit mobile number or 4 digit UHID."
          }
          returnJsonObj[icount] = invalidNumMsg;
          console.log("building returnJsonObj: ", JSON.stringify(returnJsonObj));
          icount++;
        }
        continue;
      }
      if (onlyMixOfAlphaNumeric.test(strArray[i])) {
        console.log("inside onlyMixOfAlphaNumeric: contains only alphanumeric ", strArray[i]);
        var invalidAlphaNumMsg = {
          "msgtype" : "failed",
          "message": "Names cannot contain number. Please try again with spaces between names and numbers."
        }
        returnJsonObj[icount] = invalidAlphaNumMsg;
        console.log("building returnJsonObj: ", JSON.stringify(returnJsonObj));
        icount++;
      }
    }
    returnJsonObj[icount] = jsonSrchObject;
    //return returnJsonObj;
    return jsonSrchObject;
}

exports.getParsedSearchString = getParsedSearchString;
