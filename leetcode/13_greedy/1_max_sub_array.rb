=begin
  Given an integer array nums, find the subarray with the largest sum, and return its sum.

  Example 1:

  Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
  Output: 6
  Explanation: The subarray [4,-1,2,1] has the largest sum 6.
=end


def max_sub_array(nums)
  max_sum = nums[0]
  current_sum = nums[0]

  nums[1..].each do |num|
    current_sum = [current_sum + num, num].max
    max_sum = [max_sum, current_sum].max
  end
  max_sum
end

nums = [-2,1,-3,4,-1,2,1,-5,4]
p max_sub_array(nums)
