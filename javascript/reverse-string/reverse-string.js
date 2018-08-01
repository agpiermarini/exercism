var pry = require('pryjs');

function reverseString (string) {
  return string.split("").reverse().join("")
}


module.exports = reverseString
