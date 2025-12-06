=begin
  You are given an integer array nums. You are initially positioned
  at the array's first index, and each element in the array represents
  your maximum jump length at that position.

  Return true if you can reach the last index, or false otherwise.

  Example 1:
  Input: nums = [2,3,1,1,4]
  Output: true
  Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.


  Example 2:
  Input: nums = [3,2,1,0,4]
  Output: false
  Explanation: You will always arrive at index 3 no matter what. Its m
=end


def can_jump(nums)
  pointer = nums.length-1
  current_target = nums.length-1

  while pointer >= 0 do
    if (nums[pointer] + pointer) >= current_target
      current_target = pointer
    end
    pointer -= 1
  end
  current_target == 0
end

nums = [2,3,1,1,4]
p can_jump(nums)
