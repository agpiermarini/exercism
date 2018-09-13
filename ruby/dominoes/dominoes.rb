class Dominoes
  def self.chain(input_dominoes)
    return special_case(input_dominoes) if input_dominoes.length <= 1

    input_dominoes_reverse = input_dominoes.map { | dominoe | dominoe.reverse }

    possible_pieces = input_dominoes.zip(input_dominoes_reverse)

    possible_permutations = possible_pieces.permutation(input_dominoes.length).to_a

    dominoe_selections = [0, 1].repeated_permutation(input_dominoes.length).to_a


    possible_permutations.each do | permutation |
      dominoe_selections.each do | selection |
        dominoe_set = []
        selection.each_with_index do | index, i |
          dominoe_set.push(permutation[i][index])
        end
        return dominoe_set if correct_set?(dominoe_set)
      end
    end
    return nil
  end

  def self.correct_set?(dominoe_set)
    return false if dominoe_set[0].first != dominoe_set[-1].last
    dominoe_set.each_with_index do | dominoe, index |
      if index <= dominoe_set.length - 2
        next_dominoe = dominoe_set[index + 1]
        return false if dominoe[-1] != next_dominoe[0]
      end
    end
    return true
  end

  def self.special_case(input_dominoes)
    if input_dominoes.length.zero?
      []
    elsif input_dominoes[0][0] == input_dominoes[0][-1]
      input_dominoes
    else
      nil
    end
  end
end

module BookKeeping; VERSION = 1; end 
