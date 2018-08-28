# class Change
#   def self.generate(coins, total, remainder = total, index = -1, coin_count = Array.new, solutions = [])
#     return coin_count if total == 0
#     return solution(solutions) if coins[index].nil?
#     if remainder == 0
#       solutions.push(coin_count)
#       coins.delete_at(-1)
#       generate(coins, total, remainder = total, index = -1, coin_count = Array.new, solutions)
#     elsif remainder - coins[index] >= 0
#       remainder -= coins[index]
#       generate(coins, total, remainder, index, coin_count.unshift(coins[index]), solutions)
#     else
#       generate(coins, total, remainder, index -= 1, coin_count, solutions)
#     end
#   end
#
#   private
#     def self.solution(solutions)
#       return -1 if solutions.flatten.empty?
#       solutions.sort.last
#     end
# end

class Node
  attr_reader :total, :children, :current_coin
  def initialize(coins, total, current_coin = nil)
    @coins        = coins
    @total        = total
    @current_coin = current_coin
    @children     = []
  end

  def append
    @coins.each_with_index do | coin_value, index |
      new_total = @total - coin_value
      new_node = Node.new(@coins[0..index], new_total, coin_value)
      if new_total >= 0
        @children.push(new_node)
        new_node.append
      end
    end
  end

  def leaf?
    @children.empty?
  end
end

class Btree
  attr_reader :root, :solutions
  def initialize
    @root  = nil
    @solutions = []
  end

  def generate(coins, total)
    @root = Node.new(coins, total) if @root.nil?
    @root.append and return self
  end

  def find_solutions(node = @root, coins = nil)
    if node.leaf? && node.total == 0
      coins.push(node.current_coin) if node.current_coin
      @solutions.push(coins)
    elsif node.current_coin.nil?
      node.children.each { | child | find_solutions(child, []) }
    elsif node.total >= 0
      coins.push(node.current_coin)
      node.children.each { | child | find_solutions(child, coins.dup) }
    end
    @solutions
  end
end
