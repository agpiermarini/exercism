class Squares
  def initialize(number)
    @number = number
  end

  def square_of_sum
    range.map { |num| num }.sum ** 2
  end

  def sum_of_squares
    range.map { |num| num ** 2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private
    def range
      (1..@number).to_a
    end
end

module BookKeeping
  VERSION = 4
end
