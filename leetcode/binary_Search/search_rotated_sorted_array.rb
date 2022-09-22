# There is an integer array nums sorted in ascending order (with distinct values).

# Prior to being passed to your function, nums is possibly rotated at an unknown pivot 
# index k (1 <= k < nums.length) such that the resulting 
# array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). 
# For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

# Given the array nums after the possible rotation and an integer target, 
# return the index of target if it is in nums, or -1 if it is not in nums.

# You must write an algorithm with O(log n) runtime complexity.


# Example 1:

# Input: nums = [4,5,6,7,0,1,2], target = 0
# Output: 4
# Example 2:

# Input: nums = [4,5,6,7,0,1,2], target = 3
# Output: -1
# Example 3:

# Input: nums = [1], target = 0
# Output: -1


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left = 0
  right = nums.length-1

  while left <= right do
    middle = (left + right) / 2

    return middle if nums[middle] == target

    if nums[left] <= nums[middle]
      # left
      if target > nums[middle] || target < nums[left]
        left = middle + 1
      else
        right = middle - 1
      end

    else
      # rights
      if target < nums[middle] || target > nums[right]
        right = middle - 1
      else
        left = middle + 1
      end
      
    end
  end
  return -1
end

puts search([4,5,6,7,0,1,2], 0)
