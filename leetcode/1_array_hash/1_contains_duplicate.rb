=begin

https://leetcode.com/problems/contains-duplicate/

Given an integer array nums, return true if any value appears at least twice in the array, 
and return false if every element is distinct.

Example 1:

Input: nums = [1,2,3,1]
Output: true

=end

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  lookup = {}
    nums.each_with_index do |num, index|
      return true if lookup.has_key?(num.to_s)
      lookup[num.to_s] = index
    end
  return false
end

=begin
Alternate Ans

def contains_duplicate(nums)
  !nums.detect {|num| nums.count(num) > 1}.nil?
end

=end

p contains_duplicate([1,2,3,1])