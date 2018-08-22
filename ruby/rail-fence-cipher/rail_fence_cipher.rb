class RailFenceCipher

  def self.encode(string, rails)
    buckets = Array.new(rails) {[]}
    indices = calculate_indices(rails, string.length)
    string.chars.zip(indices).each { | array | buckets[array[1]] << array[0] }
    buckets.flatten.join('')
  end

  def self.decode(string, rails)
    return string if string.empty? || rails == 1

    indices = calculate_indices(rails, string.length)

    buckets = Array.new(rails) {[]}

    counts = Hash.new(0)

    indices.each { |index| counts[index] += 1 }

    counts.each do |k,v|
      if k == 0
        buckets[k] << string.chars[0..(counts[k] - 1)]
      else
        counts[k] += counts[k-1]
        buckets[k] << string.chars[counts[k-1]..(counts[k]-1)]
      end
      buckets[k].flatten!
    end

    decoded_string = ""

    i = 0
    until buckets.all? { |bucket| bucket.empty? }
      buckets.each_with_index do |bucket, index|
        next if bucket.empty? || i > 0 && index == 0
        decoded_string += bucket.shift
      end
      buckets.reverse!
      i += 1
    end

    decoded_string


  end

  private
    def self.calculate_indices(rails, string_length)
      indices = (0..(rails - 1)).to_a + (1..(rails-2)).to_a.reverse
      multiplier = (string_length/indices.length) + 1
      (indices * multiplier)[0..string_length-1]
    end
end
