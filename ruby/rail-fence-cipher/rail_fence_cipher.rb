class RailFenceCipher
  def self.encode(string, rails)
    buckets = Array.new(rails) {[]}
    indices = calculate_indices(rails, string.length)
    string.chars.zip(indices).each { | array | buckets[array[1]] << array[0] }
    buckets.flatten.join('')
  end

  def self.decode(string, rails)
    return string if string.empty? || rails == 1
    buckets = parse_encoded_string(string, rails)
    decoded_string = ""
    decode_string(buckets, string.length)
  end

  private
    def self.calculate_indices(rails, string_length)
      indices = (0..(rails - 1)).to_a + (1..(rails-2)).to_a.reverse
      multiplier = (string_length/indices.length) + 1
      (indices * multiplier)[0..string_length-1]
    end

    def self.generate_counts(string, rails)
      counts = Hash.new(0)
      indices = calculate_indices(rails, string.length)
      indices.each { |index| counts[index] += 1 }
      counts
    end

    def self.parse_encoded_string(string, rails)
      counts = generate_counts(string, rails)
      counts.map do | k, _v |
        if k == 0
          string.chars[0..(counts[k] - 1)]
        else
          counts[k] += counts[k-1]
          string.chars[counts[k-1]..(counts[k]-1)]
        end.flatten
      end
    end

    def self.decode_string(buckets, string_length, decoded_string = "", i = 0)
      return decoded_string if i == string_length
      buckets.each_with_index do | bucket, index |
        next if i > 0 && index == 0 || bucket.empty?
        decoded_string += bucket.shift
      end.reverse!
      decode_string(buckets, string_length, decoded_string, i += 1)
    end
end

VERSION = 1
