/**
This function accepts a string and provides boolean results of whether it contains onlyNumbers, onlyLetters
or onlyMixOfAlphaNumeric
*/
async function matchExpressions(str)  {

var expMatch = {
  "onlyNumbers" : "",
  "onlyLetters" : "",
  "mixOfAlphaNumeric" : ""
}

var onlyLetters = /^[A-Za-z]+$/;
var onlyNumbers = /^[0-9]+$/;
var onlyMixOfAlphaNumeric = /^[0-9a-zA-Z]+$/;

expMatch.onlyLetters = onlyLetters.test(str);
expMatch.onlyNumbers = onlyNumbers.test(str);
expMatch.mixOfAlphaNumeric = onlyMixOfAlphaNumeric.test(str);

console.log("test rgularExp.onlyLetters: ", expMatch.onlyLetters);
console.log("test rgularExp.onlyNumbers: ", expMatch.onlyNumbers);
console.log("test rgularExp.mixOfAlphaNumeric: ", expMatch.mixOfAlphaNumeric);

return JSON.stringify(expMatch);
//return expMatch;
}

exports.matchExpressions = matchExpressions;
