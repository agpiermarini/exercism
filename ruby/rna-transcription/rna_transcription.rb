require_relative 'dna_complements'

class Complement
  include DnaComplements

  def self.of_dna(letters)
    letters.chars.map{ | letter | COMPLEMENTS[letter] || (return '') }.join
  end
end

module BookKeeping
  VERSION = 4 # Where the version number matches the one in the test.
end
