class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(value)
    if value <= data
      self.left ? self.left.insert(value) : self.left = Bst.new(value)
    else
      self.right ? self.right.insert(value) : self.right = Bst.new(value)
    end
  end

  def each(&block)
    return to_enum unless block_given?
    self.left.each(&block) if self.left
    yield(data)
    self.right.each(&block) if self.right
  end
end

module BookKeeping
  VERSION = 1
end
