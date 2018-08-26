class ListOps
  def self.arrays(array)
    count = 0
    for n in array
      count += 1
    end
    count
  end

  def self.reverser(array)
    reversed = []
    for n in array
      reversed.unshift(n)
    end
    reversed
  end

  def self.concatter(array1, array2)
    for n in array2
      array1.push(n)
    end
    array1
  end

  def self.mapper(array)
    new_array = []
    for n in array
      new_array.push(yield(n))
    end
    new_array
  end

  def self.filterer(array)
    new_array = []
    for n in array
      new_array.push(n) if yield(n)
    end
    new_array
  end

  def self.sum_reducer(array)
    total = 0
    for n in array
      total += n
    end
    total
  end

  def self.factorial_reducer(array)
    total = 1
    return total if array.empty?
    for n in array
      total = total * n
    end
    total
  end
end

module BookKeeping
  VERSION = 2
end
