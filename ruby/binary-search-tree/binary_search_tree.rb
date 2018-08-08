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
end
