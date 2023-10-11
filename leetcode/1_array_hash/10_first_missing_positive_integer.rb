=begin

https://leetcode.com/problems/first-missing-positive/description/

Given an unsorted integer array nums, 
return the smallest missing positive integer.

You must implement an algorithm that runs in O(n) time and uses constant extra space.

Input: nums = [1,2,0]
Output: 3
Explanation: The numbers in the range [1,2] are all in the array.

Input: nums = [3,4,-1,1]
Output: 2
Explanation: 1 is in the array but 2 is missing.

=end

# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  len = nums.length
  new_arr = Array.new(len+1)

  nums.each do |num|
    new_arr[num] = num if (num > 0) && (num <= len)
  end

  (1..len).each do |num|
    return num if new_arr[num].nil?
  end
  new_arr.size
end

p first_missing_positive([3,4,-1,1])