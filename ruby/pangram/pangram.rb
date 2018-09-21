class Pangram
  def self.pangram?(phrase)
    ALPHABET.all? { | letter | phrase.downcase.include?(letter) }
  end
end

ALPHABET = ("a".."z").to_a

module BookKeeping; VERSION = 6; end
