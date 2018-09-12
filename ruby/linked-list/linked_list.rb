class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(node = @head, value)
    if @head.nil?
      new_node = Node.new(value)
      @head, @tail = new_node, new_node
    elsif node.next
      push(node.next, value)
    else
      new_node = node.append(Node.new(value))
      @tail = new_node
    end
  end

  def pop
    if @head == @tail
      value, @head, @tail = @head.value, nil, nil
    else
      new_tail, value = @tail.previous, @tail.value
      @tail, @tail.next = new_tail, nil
    end
    value
  end

  def shift
    if @head == @tail
      value, @head, @tail = @head.value, nil, nil
    else
      new_head, value, = @head.next, @head.value
      @head = new_head
    end
    value
  end

  def unshift(value)
    if @head.nil?
      new_node = Node.new(value)
      @head, @tail = new_node, new_node
    else
      old_head = @head
      new_head = Node.new(value)
      @head, @head.next, old_head.previous = new_head, old_head, new_head
    end
  end
end

class Node
  attr_reader :value
  attr_accessor :next, :previous

  def initialize(value)
    @previous = nil
    @value = value
    @next = nil
  end

  def append(new_node)
    self.next = new_node
    new_node.previous = self
    new_node
  end
end
