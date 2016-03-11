require 'pry'

class Array
  def iterative_binary_search(int, array)
       
  end

  def recursive_binary_search(target)
    the_end = self.size
    halfway = self.size/2
    # base case of size 3
    if self.size <= 3
      [0,1,2].each do |i|
        if self[i] == target
          return i
        end
      end
    elsif target < self[halfway]
      # '...' operator is exclusive region (doesn't include
      # the element at size/2)
      return self[0...halfway].recursive_binary_search(target)
    else
      # important to add the first half of the array's size
      # to get the index in the outer array
      index_in_latter_half = self[halfway..the_end].recursive_binary_search(target)
      return halfway + index_in_latter_half unless index_in_latter_half.nil?
    end

    # if here, it wasn't in the array
    return nil
  end

  def sliced_binary_search(target)
    # uses array indecies to slice the array
    # into halves progressively
    front = 0
    mid = self.size/2
    back = self.size-1

    while true
      # "base" case of length 3
      if back - front <= 2
        [0,1,2].each do |i|
          absolute_index = front + i
          if self[absolute_index] == target
            return absolute_index
          end
        end
        return nil        
      elsif target < self[mid]
        # if in first half of array, move end
        # pointer to middle
        back = mid - 1
      else
        # if in second half, move front pointer
        # to mid
        front = mid
      end
    end
  end
end
