=begin
  You are given a 0-indexed array of integers nums of length n.
  You are initially positioned at index 0.

  Each element nums[i] represents the maximum length of a forward jump from index i.
  In other words, if you are at index i,
  you can jump to any index (i + j) where:

  Return the minimum number of jumps to reach index n - 1.
  The test cases are generated such that you can reach index n - 1.

  Example 1:
  Input: nums = [2,3,1,1,4]
  Output: 2
  Explanation: The minimum number of jumps to reach the last index is 2.
  Jump 1 step from index 0 to 1, then 3 steps to the last index.

  Example 2:
  Input: nums = [2,3,0,1,4]
  Output: 2
=end

def jump(nums)
  left = right = result = max = 0

  while right < nums.length-1 do
    (left..right).each do |counter|
      max = [max, counter+nums[counter]].max
    end
    left = right+1
    right = max
    result += 1
  end
  result
end

nums = [2,3,1,1,4]
p jump(nums)
