class BinarySearch
  attr_reader :list
  def initialize(list)
    @list = list
    check_list
  end

  def search_for(value, array = list, depth = 0)
    return error { RuntimeError.new } if array.empty?
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
      list == list.sort ? list : error { ArgumentError.new }
      # middle = list.length/2
      # array_sorted?(list[0...middle], list[middle], -1) { -1 }
      # array_sorted?(list[middle + 1..-1], list[middle], 0) { 1 }
      # list
    end
    #
    # def array_sorted?(array, val, index)
    #   return true if array[index].nil?
    #   index >= 0 ? check_val(array[index], val) : check_val(val, array[index])
    #   array_sorted?(array, array[index], index + yield) { yield }
    # end
    #
    # def check_val(val1, val2)
    #   val1 > val2 ? true : error { ArgumentError.new }
    # end

    def error; raise yield; end
end
