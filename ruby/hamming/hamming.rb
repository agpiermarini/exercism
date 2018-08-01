class Hamming
  def self.compute(string1, string2)
    raise ArgumentError unless check_length(string1, string2)
    string1.split("").map.with_index do | letter, index |
      letter == string2.split("")[index] ? 0 : 1
    end.sum
  end

  def self.check_length(string1, string2)
    string1.length == string2.length
  end
end

module BookKeeping
  VERSION = 3
end
