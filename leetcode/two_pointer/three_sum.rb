# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]]
# such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

# Notice that the solution set must not contain duplicate triplets.


# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]

# Input: nums = []
# Output: []


# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums = nums.sort
  result = []
  
  nums.each_with_index do |num, index|
    next if (index > 0) and (num == nums[index-1])

    left = index+1
    right = nums.length-1
    
    while (left < right) do
      sum = nums[left] + nums[right] + num

      if sum > 0
        right -= 1
      elsif sum < 0
        left += 1
      else
        result << [nums[left] , nums[right] , num]
        left += 1
        while (nums[left] == nums[left-1]) and (left < right) do
          left += 1
        end
      end
    end
  end
  result
end

p three_sum([-1,0,1,2,-1,-4])
p three_sum([0])