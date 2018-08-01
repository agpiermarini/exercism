//
// This is only a SKELETON file for the "Leap" exercise. It's been provided as a
// convenience to get you started writing code faster.
//
var Year = function (year) {
  this.year = year;
};

Year.prototype.isLeap = function () {
  if(this.year % 400 == 0 || this.year % 100 != 0) {
    return this.year % 4 == 0 ? true : false;
  }
  return false;
};

module.exports = Year;
