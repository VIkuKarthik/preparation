require 'pry'
=begin

Permutations

Given an array nums of distinct integers, return all the possible
permutations. You can return the answer in any order.

Example 1:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

=end

def permute(nums)
  return [[]] if nums.length == 0

  perms = permute(nums.drop(1))
  result = []

  perms.each do |perm|
    (perm.length+1).times do |index|
      perm_dup = perm.dup
      perm_dup.insert(index, nums[0])
      result << perm_dup
    end
  end
  result
end

nums = [1,2,3]
p permute(nums)
