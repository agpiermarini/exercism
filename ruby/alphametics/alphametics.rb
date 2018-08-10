class Alphametics
  def self.solve(input)
    left, right = input.split(" == ")

    return {} if left.length == 1 && right.length == 1 && right[0] == left[0]

    right = right.split('')

    left = left.split(' + ').map! { | word | word.split('') }

    unique_chars = (left + right).flatten.uniq.sort

    combinations = (0..9).to_a.combination(unique_chars.length).map do | array |
      array.permutation.each do | arr |

        values = Hash.new(0)

        arr.each_with_index do | value, index |
          values[unique_chars[index]] = value
        end

        next if values[left[0][0]] == 0 || values[right[0]] == 0

        left_sum = left.map do | array |
          array.map { | letter| values[letter].to_s }.join('').to_i
        end.sum

        right_sum = right.map { | letter | values[letter].to_s }.join('').to_i

        return values if (left_sum == right_sum)
      end
    end
    return {}
  end
end
