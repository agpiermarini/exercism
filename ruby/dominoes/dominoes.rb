class Dominoes
  def self.chain(input_dominoes)
    return special_case(input_dominoes) if input_dominoes.count <= 1
    dominoe_permutations = calculate_dominoe_permutations(input_dominoes)
    index_permutations   = calculate_index_permutations(input_dominoes.count)
    find_solution(dominoe_permutations, index_permutations)
  end

  private
    def self.proper_chain?(chain)
      return false if chain[0][0] != chain[-1][-1]
      0.upto(chain.length - 2).all? { | i | chain[i][-1] == chain[i + 1][0] }
    end

    def self.special_case(dominoe)
      return [] if dominoe.empty?
      dominoe[0][0] == dominoe[0][-1] ? dominoe : nil
    end

    def self.calculate_dominoe_permutations(input_dominoes)
      dominoes_reversed = input_dominoes.map { | dominoe | dominoe.reverse }
      possible_pieces   = input_dominoes.zip(dominoes_reversed)
      possible_pieces.permutation(input_dominoes.count)
    end

    def self.calculate_index_permutations(dominoe_count)
      [0, 1].repeated_permutation(dominoe_count)
    end

    def self.find_solution(dominoe_permutations, index_permutations)
      dominoe_permutations.each do | permutation |
        index_permutations.each do | selections |
          chain = selections.map.with_index { | sel, i | permutation[i][sel] }
          return chain if proper_chain?(chain)
        end
      end
      nil
    end
end

module BookKeeping; VERSION = 1; end
