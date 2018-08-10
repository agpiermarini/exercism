class Alphametics
  def self.solve(input)
    left, right = input.split(" == ")

    return {} if left.length == 1 && right.length == 1 && right[0] == left[0]

    right = right.split('')

    left = left.split(' + ').map! { | word | word.split('') }

    unique_chars = (left + right).flatten.uniq.sort

    (0..9).to_a.combination(unique_chars.length).map do | comb |
      comb.permutation.each do | perm |

        values = Hash.new(0)

        perm.each_with_index do | value, index |
          values[unique_chars[index]] = value
        end

        next if values[left[0][0]] == 0 || values[right[0]] == 0

        left_sum = left.map do | word |
          word.map { | letter | values[letter] }.join('').to_i
        end.sum

        right_sum = right.map { | letter | values[letter].to_s }.join('').to_i

        return values if (left_sum == right_sum)
      end
    end
    return {}
  end
end

module BookKeeping
  VERSION = 4
end
