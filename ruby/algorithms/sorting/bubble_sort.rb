# Overview: Bubble sort is a simple sorting algorithm. This sorting algorithm is comparison-based algorithm
#           in which each pair of adjacent elements is compared and the elements are swapped if they are not in order.
# Ref: https://www.tutorialspoint.com/data_structures_algorithms/bubble_sort_algorithm.htm
# Time-complexity: O(n^2)
# Visualizer: https://algorithm-visualizer.org/brute-force/bubble-sort

non_sorted_array = [2, 9, 12, 2, 0, 1, 6]

def do_bubble_sort(array)
  n = array.length
  for i in 0...n - 1
    for j in 0...n - i - 1 # To set largest number to last index
      if array[j] > array[j + 1]
        temp = array[j]
        array[j] = array[j + 1]
        array[j + 1] = temp
      end
    end
  end
  return array
end

sorted_array = do_bubble_sort(non_sorted_array)
puts sorted_array
