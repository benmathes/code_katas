require 'minitest/autorun'
require_relative 'closest_pair'

class ArrayTest < MiniTest::Test

  def test_closest_pair_to_zero_exact_negative
    result = [-3, 1, 3, 4].closest_pair_to_zero
    assert_equal(result[:distance], 0)
    assert_equal(result[:pair], [-3,3])
  end

  def test_closest_pair_to_zero_approx
    result = [3, 1, 3, 4].closest_pair_to_zero
    assert_equal(result[:distance], 4)
    assert_equal(result[:pair], [1,3])
  end

  def test_closest_pair_to_zero_approx
    result = [3, 1, 3, 4].closest_pair_to_zero
    assert_equal(result[:distance], 4)
    assert_equal(result[:pair], [1,3])
  end

  def test_closest_pair_to_zero_approx_negative
    result = [-5,-4,-3,-2,-1].closest_pair_to_zero
    assert_equal(result[:distance], 3)
    assert_equal(result[:pair], [-2, -1])
  end

  def test_closest_pair_to_zero_exact_negative
    result = [-3,-2,1,2,3,6,8,9].closest_pair_to_zero
    assert_equal(result[:distance], 0)
    assert_equal(result[:pair], [-3, 3])
  end


  def test_closest_binary_search_empty_list
    assert_equal(nil, [].closest_binary_search(3))
  end

  def test_closest_binary_search_empty_list_nil_target
    assert_equal(nil, [].closest_binary_search(nil))
  end

  def test_closest_binary_search_length_one_list_exact
    assert_equal(3, [3].closest_binary_search(3))
  end

  def test_closest_binary_search_length_one_list_approx
    assert_equal(3, [3].closest_binary_search(4))
  end

  def test_closest_binary_search_length_one_list_approx_neg
    assert_equal(-3, [-3].closest_binary_search(4))
  end

  def test_closest_binary_search_length_one_list_approx_neg
    assert_equal(3, [3].closest_binary_search(-4))
  end

  def test_closest_binary_search_length_two_approx
    assert_equal(4, [3,4].closest_binary_search(5))
  end

  def test_closest_binary_search_length_two_exact
    assert_equal(4, [3,4].closest_binary_search(5))
  end

  def test_closest_binary_search_length_two_exact_neg
    assert_equal(-4, [3,-4].closest_binary_search(-4))
  end

  def test_closest_binary_search_length_two_approx_neg
    assert_equal(-4, [3,-4].closest_binary_search(-5))
  end

  def test_closest_binary_search_long_exact_split_right
    assert_equal(5, [1,2,3,4,5,6,7].closest_binary_search(5))
  end

  def test_closest_binary_search_long_exact_split_left
    assert_equal(3, [1,2,3,4,5,6,7].closest_binary_search(3))
  end

  def test_closest_binary_search_long_approx_split_right
    assert_equal(5, [1,2,3,4,5,6,7].closest_binary_search(5))
  end

  def test_closest_binary_search_long_approx_split_left
    # demonstrates that the lesser of two equally-close will
    # be returned
    assert_equal(2, [1,2,4,5,6,7].closest_binary_search(3))
  end


  def test_closest_binary_search_long_exact_split_right_neg
    assert_equal(3, [-10,-3,-2,-1,1,2,3].closest_binary_search(5))
  end

  def test_closest_binary_search_long_exact_split_left_neg
    assert_equal(-3, [-10,-3,-2,-1,1,2,3,4,5,6,7].closest_binary_search(-3))
  end

  def test_closest_binary_search_long_approx_split_right_neg
    assert_equal(-2, [-10,-9,-8,-7,-2,1].closest_binary_search(-1))
  end

  def test_closest_binary_search_long_approx_split_left_neg
    # demonstrates that the lesser of two equally-close will
    # be returned
    assert_equal(-3, [-10,-3,-2,-1,1,2,3,4,5,6,7].closest_binary_search(-4))
  end

end
