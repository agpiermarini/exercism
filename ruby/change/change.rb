class Change
  def self.generate(coins, total, remainder = total, index = -1, coin_count = Array.new, solutions = [])
    return [] if total == 0
    return solution(solutions) if coins[index].nil?
    if remainder == 0
      solutions.push(coin_count)
      coins.delete_at(-1)
      generate(coins, total, remainder = total, index = -1, coin_count = Array.new, solutions)
    elsif remainder - coins[index] >= 0
        remainder -= coins[index]
        generate(coins, total, remainder, index, coin_count.unshift(coins[index]), solutions)
    else
      generate(coins, total, remainder, index -= 1, coin_count, solutions)
    end
  end

  private
    def self.solution(solutions)
      return -1 if solutions.flatten.empty?
      solutions.sort_by { | solution | solution.count }.first
    end
end
