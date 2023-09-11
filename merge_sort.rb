def merge_sort(array)
  # Base case: return the array if its length is 1 or 0
  return array if array.length <= 1

  # Split the array into two halves
  mid = array.length / 2
  left_half = array[0...mid]
  right_half = array[mid..-1]

  # Recursively sort both halves
  sorted_left = merge_sort(left_half)
  sorted_right = merge_sort(right_half)

  # Merge the two sorted halves
  merge(sorted_left, sorted_right)
end

def merge(left, right)
  result = []

  # As long as both arrays have elements, compare and push the smaller element
  until left.empty? || right.empty?
    if left.first < right.first
      result << left.shift
    else
      result << right.shift
    end
  end

  # Concatenate any remaining elements from both left and right
  result + left + right
end

# Example
arr = [4, 3, 2, 6, 5, 7, 1, 8]
sorted_arr = merge_sort(arr)
puts sorted_arr  # This will print: "1 2 3 4 5 6 7 8"
