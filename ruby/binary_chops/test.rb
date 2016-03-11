require 'minitest/autorun'
require_relative 'binary_search'

class TestBinarySearch < MiniTest::Test

  # format: [expected result, search target, array]
  @@test_cases = [
    [nil,3, []],
    [nil,3, [1]],
    [0, 1, [1]],
    [0, 1, [1, 3, 5]],
    [1, 3, [1, 3, 5]],
    [2, 5, [1, 3, 5]],
    [nil,0, [1, 3, 5]],
    [nil,2, [1, 3, 5]],
    [nil,4, [1, 3, 5]],
    [nil,6, [1, 3, 5]],
    [0, 1, [1, 3, 5, 7]],
    [1, 3, [1, 3, 5, 7]],
    [2, 5, [1, 3, 5, 7]],
    [3, 7, [1, 3, 5, 7]],
    [nil,0, [1, 3, 5, 7]],
    [nil,2, [1, 3, 5, 7]],
    [nil,4, [1, 3, 5, 7]],
    [nil,6, [1, 3, 5, 7]],
    [nil,8, [1, 3, 5, 7]],
  ]

  ["recursive", "sliced"].each do |method|
    @@test_cases.each_with_index do |test_case, i|
      expected, target, array = test_case
      define_method "test_#{method}_binary_search_#{i}" do
        assert_equal(expected, array.send("#{method}_binary_search", target))
      end
    end
  end
  
end
