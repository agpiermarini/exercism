class Change
  def self.generate(coins, total, elements = 0)
    return [] if total.zero?
    return -1 if elements > total

    solution = coins.repeated_combination(elements).find { |c| c.sum == total }

    solution ? solution : generate(coins, total, elements += 1)
  end
end

module BookKeeping
  VERSION = 2
end
