# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
	lookup = {}
	nums.each_with_index do |num, index|
		return [lookup[num], index] if lookup[num]
		lookup[target - num] = index
	end
end

puts two_sum([2,7,11,15], 9)