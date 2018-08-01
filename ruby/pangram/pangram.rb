class Pangram
  def self.pangram?(phrase)
    split_phrase = phrase.downcase.split("").uniq
    alphabet.all? { | letter | split_phrase.include?(letter) }
  end

  private
    def self.alphabet
      ("a".."z").to_a
    end
end

module BookKeeping
  VERSION = 6
end
