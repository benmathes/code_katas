require 'minitest/autorun'
require 'pry'

class Array

  def closest_pair_to_zero
    # O(nlog(n))
    sorted = self.sort # [3, 1, 3, 4]

    closest_pair = {
      distance: nil,
      pair: nil
    }

    # O(nlog(n))
    self.each_with_index do |n, i| # 1, 3, 3, 4
      # the closest might be ourself. but that's not a pair.
      rest_of_array = sorted
      rest_of_array.delete_at(i) # running time now depends on efficienty of delete_at

      closest_for_n = rest_of_array.closest_binary_search(-n)
      begin
        if closest_pair[:distance].nil? || (n + closest_for_n).abs - closest_pair[:distance] < 0
          closest_pair = {
            distance:  (n + closest_for_n).abs,
            pair: [n, closest_for_n].sort
          }
        end
      rescue
        binding.pry
      end

      # minor efficiency: early exit if we've found 0 already
      if closest_pair[:distance] == 0
        return closest_pair
      end
    end

    return closest_pair
  end


  # assumes a sorted list. returns the element
  # in the list closest to target
  def closest_binary_search(target)
    return nil if self.size == 0
    # uses array indecies to slice the array
    # into halves progressively
    front = 0
    back = [self.size-1, 0].max # max to handle length 0
    while true
      mid = ((back - front) / 2) + front
      # "base" case of length 3
      if back - front <= 2
        closest_to_value = nil
        (0..(back-front)).each do |i|
          absolute_index = front + i
          distance_to_n = (self[absolute_index] - target).abs
          if closest_to_value.nil? || distance_to_n < (closest_to_value - target).abs
            closest_to_value = self[absolute_index]
          end
        end
        return closest_to_value
      elsif target <= self[mid]
        # if in first half of array, move en
        # pointer to middle
        back = mid
      else
        # if in second half, move front pointer
        # to mid
        front = mid
      end
    end
  end
end
