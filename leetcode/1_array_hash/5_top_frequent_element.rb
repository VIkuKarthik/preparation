=begin

https://leetcode.com/problems/top-k-frequent-elements/

Given an integer array nums and an integer k, 
return the k most frequent elements. 
You may return the answer in any order.

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]

Input: nums = [1], k = 1
Output: [1]

=end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  lookup = Hash.new(0)
  res = []
  nums.each do |num|
    lookup[num] += 1
  end
  max_values = lookup.values.max(k)
  max_values.each do |maxi|
    res << lookup.key(maxi)
    lookup.delete(lookup.key(maxi))
  end
  res
end


p top_k_frequent([1,1,1,2,2,3], 2) # [1,2]
p top_k_frequent([1,2], 2) # [1,2]