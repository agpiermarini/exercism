class CustomSet
  attr_reader :set
  def initialize(set)
    @set = set
  end

  def empty?
    @set.empty?
  end

  def member?(element)
    @set.include?(element)
  end

  def subset?(set2)
    (@set & set2.set) == @set
  end

  def disjoint?(set2)
    (@set - set2.set) + (set2.set - @set) == @set + set2.set
  end

  def ==(set2)
    @set.sort == set2.set.sort
  end

  def add(element)
    @set |= [element] and return self
  end

  def intersection(set2)
    new_set { @set & set2.set }
  end

  def difference(set2)
    new_set { @set - set2.set }
  end

  def union(set2)
    new_set { @set |= set2.set }
  end

  def new_set
    CustomSet.new(yield)
  end
end

module BookKeeping; VERSION = 1; end
