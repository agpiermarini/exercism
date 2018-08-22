class RailFenceCipher

  def self.encode(string, rails)
    buckets = Array.new(rails) {[]}
    indices = calculate_indices(rails, string.length)
    string.chars.zip(indices).each { | array | buckets[array[1]] << array[0] }
    buckets.flatten.join('')
  end

  private
    def self.calculate_indices(rails, string_length)
      indices = (0..(rails - 1)).to_a + (1..(rails-2)).to_a.reverse
      multiplier = (string_length/indices.length) + 1
      indices * multiplier
    end
end
