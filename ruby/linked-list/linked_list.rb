class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(node = @head, value)
    return set_head(value) if list_empty?
    new_node = node.next ? push(node.next, value) : node.append(Node.new(value))
    @tail = new_node
  end

  def pop
    return clear_list if list_length_one?
    new_tail, value = @tail.previous, @tail.value
    @tail, @tail.next = new_tail, nil
    value
  end

  def shift
    return clear_list if list_length_one?
    new_head, value, = @head.next, @head.value
    @head = new_head
    value
  end

  def unshift(value)
    return set_head(value) if list_empty?
    old_head = @head
    new_head = Node.new(value)
    @head, @head.next, old_head.previous = new_head, old_head, new_head
  end

  private
    def set_head(value)
      new_node = Node.new(value)
      @head, @tail = new_node, new_node
    end

    def clear_list
      value, @head, @tail = @head.value, nil, nil
      value
    end

    def list_length_one?
      @head == @tail
    end

    def list_empty?
      @head.nil?
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
    new_node.previous = self and return new_node
  end
end
