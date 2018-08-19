class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end

end

class SimpleLinkedList

  def initialize (data = [])
    @head = nil
    @data = build_list(data.to_a)
  end

  def push(node = @head, element)
    return set_head(element) if @head.nil?
    node.next ? push(node.next, element) : node.next = element
    self
  end

  def pop(node = @head)
    return nil if @head.nil?
    return remove_head if @head.next.nil?
    node.next.next ? pop(node.next) : remove_next_node(node)
  end

  def to_a(node = @head)
    return all_datum if node.nil?
    all_datum.insert(0, node.datum)
    to_a(node.next)
  end

  def reverse!
    nodes = []
    to_a.length.times { nodes << self.pop }
    rebuild_list(nodes)
  end

  private
    def build_list(data)
      data.each { | datum | push(Element.new(datum)) }
    end

    def rebuild_list(nodes)
      @all_datum = []
      nodes.each { | node | push(node) }
      self
    end

    def set_head(element)
      @head = element
      self
    end

    def remove_head
      old_node = @head
      @head = nil
      old_node
    end

    def remove_next_node(node)
      old_node = node.next
      node.next = nil
      old_node
    end

    def all_datum
      @all_datum ||= []
    end

end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
