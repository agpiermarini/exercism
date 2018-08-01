var pry = require('pryjs')

class dnaTranscriber {
  constructor() {}

  toRna(rnaString) {
    const rnaDna = { "C": "G", "G": "C", "A": "U", "T": "A" };

    return rnaString.split("").map(letter => {
      if(rnaDna[letter] == undefined) throw Error("Invalid input");

      return rnaDna[letter];

    }).join("");

 }

}

module.exports = dnaTranscriber
