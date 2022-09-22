# Implementation Of Binary Search

# Given an sorted Array
# [1,2,3,4,5,6,7,8,9]

# And find the index of an element in the sorted given array


def binary_search(arr, target)
  pointer_left = 0
  pointer_right = arr.length-1
  middle_pointer = (arr.length / 2)

  while pointer_left <= pointer_right do
    middle_pointer =  (pointer_left + pointer_right) / 2
    puts "pointer_left: #{pointer_left}, middle_pointer: #{middle_pointer}, pointer_right: #{pointer_right}"
    if arr[middle_pointer] == target
      return middle_pointer
    elsif arr[middle_pointer] < target
      # right
      pointer_left = middle_pointer + 1
    else
      # left
      pointer_right = middle_pointer - 1
    end
  end
  false
end

puts binary_search([1,2,3,4,5,6,7,8,9], 6)