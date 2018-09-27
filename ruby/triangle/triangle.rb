class Triangle
  def initialize(sides)
    @sides = sides.sort
  end

  def equilateral?
    check_sides([1])
  end

  def isosceles?
    check_sides([1,2])
  end

  def scalene?
    check_sides([3])
  end

  private
    attr_reader :sides

    def check_sides(unique_sides)
      sides[0] != 0 &&
      sides[0] + sides[1] >= sides[2] &&
      unique_sides.include?(sides.uniq.length)
    end
end
