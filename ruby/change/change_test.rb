require 'minitest/autorun'
require_relative 'change'

# Common test data version: 1.1.0 52cf1cf
class ChangeTest < Minitest::Test
  def test_single_coin_change
    # skip
    assert_equal [25], Change.generate([1, 5, 10, 25, 100], 25)
  end

  def test_multiple_coin_change
    # skip
    assert_equal [5, 10], Change.generate([1, 5, 10, 25, 100], 15)
  end

  def test_change_with_lilliputian_coins
    # skip
    assert_equal [4, 4, 15], Change.generate([1, 4, 15, 20, 50], 23)
  end

  def test_change_with_lower_elbonia_coins
    # skip
    assert_equal [21, 21, 21], Change.generate([1, 5, 10, 21, 25], 63)
  end

  def test_large_target_values
    skip
    assert_equal [2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100], Change.generate([1, 2, 5, 10, 20, 50, 100], 999)
  end

  def test_possible_change_without_unit_coins_available
    # skip
    assert_equal [2, 2, 2, 5, 10], Change.generate([2, 5, 10, 20, 50], 21)
  end

  def test_another_possible_change_without_unit_coins_available
    # skip
    assert_equal [4, 4, 4, 5, 5, 5], Change.generate([4, 5], 27)
  end

  def test_no_coins_make_0_change
    # skip
    assert_equal [], Change.generate([1, 5, 10, 21, 25], 0)
  end

  def test_error_testing_for_change_smaller_than_the_smallest_of_coins
    # skip
    assert_equal -1, Change.generate([5, 10], 3)
  end

  def test_error_if_no_combination_can_add_up_to_target
    # skip
    assert_equal -1, Change.generate([5, 10], 94)
  end

  def test_cannot_find_negative_change_values
    # skip
    assert_equal -1, Change.generate([1, 2, 5], -5)
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    # skip
    assert_equal 2, BookKeeping::VERSION
  end
end

class BtreeTest < Minitest::Test
  def test_it_exists
    # skip
    coins = [1, 5, 10, 25]
    total = 35
    root = Node.new(coins, total)
    btree = Btree.new(root)

    assert_instance_of Btree, btree
    assert_instance_of Node, btree.root
  end

  def test_it_can_generate_branches
    # skip
    coins = [1, 5, 10, 25]
    total = 35
    btree = Btree.new(Node.new(coins, total))

    assert_instance_of Node, btree.root
    btree.root.children.each { | c | assert_instance_of Node, c }
    btree.root.children.each { | c | assert_equal total - c.coins.first, c.total }
  end
end

class NodeTest < Minitest::Test
  def test_it_exists
    # skip
    coins = [1, 5, 10, 25]
    total = 100
    node = Node.new(coins, total)

    assert_instance_of Node, node
    assert_equal total, node.total
    assert_instance_of Array, node.children
    assert node.children.empty?
  end
end
