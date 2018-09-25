class BinarySearch
  attr_reader :list
  def initialize(list)
    @list = list
    check_list
  end

  def search_for(value, array = list, depth = 0)
    return error { RuntimeError.new("Value not found") } if array.empty?
    middle = array.length / 2
    if value == array[middle]
      depth += middle
    elsif value < array[middle]
      search_for(value, array[0...middle], depth)
    elsif value > array[middle]
      search_for(value, array[middle + 1..-1], depth += middle + 1)
    end
  end

  def middle
    list.length/2
  end

  private
    def check_list
      error { ArgumentError.new("List not sorted") } if list != list.sort
    end

    def error; raise yield; end
end
