class Change
  def self.generate(coins, total)
    @solutions, @btree = nil
    @coins, @total = coins, total
    optimal_solution
  end

  private
    def self.find_solutions(children = btree.root.children, coins = [])
      children.each do | node |
        updated_coins = coins.dup.unshift(node.coins.first)
        solutions.push(updated_coins) if node.total == 0
        find_solutions(node.children, updated_coins)
      end
      solutions
    end

    def self.optimal_solution
      return [] if @total.zero?
      return -1 if no_solutions?
      solutions.sort_by { | solution | solution.count }.first
    end

    def self.no_solutions?
      bad_total? || find_solutions.empty?
    end

    def self.bad_total?
      @total < 0 || @total < @coins.sort.first
    end

    def self.btree
      @btree ||= Btree.new(Node.new(@coins, @total))
    end

    def self.solutions
      @solutions ||= []
    end
end

class Btree
  attr_reader :root
  def initialize(root)
    @root  = root
    generate
  end

  private
    def generate
      root.append and return self
    end
end

class Node
  attr_reader :coins, :total, :children
  def initialize(coins, total)
    @coins        = coins.sort.reverse
    @total        = total
    @children     = []
  end

  def append
    coins.each_with_index do | coin_value, index |
      new_total = total - coin_value
      new_child(coins[index..-1], new_total).append if new_total >= 0
    end
  end

  private
    def new_child(coins, total)
      children.push(Node.new(coins, total)).last
    end
end

module BookKeeping
  VERSION = 2
end
