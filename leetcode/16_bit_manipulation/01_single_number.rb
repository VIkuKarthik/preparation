=begin
  Single Number

  Given a non-empty array of integers nums, every element
  appears twice except for one. Find that single one.

  You must implement a solution with a linear runtime
  complexity and use only constant extra space.

  Example:
  Input: nums = [2,2,1]
  Output: 1

  Input: nums = [4,1,2,1,2]
  Output: 4
=end


def single_number(nums)
  res = 0
  nums.each do |num|
    res = num ^ res
  end
  res
end

nums = [4,1,2,1,2]
p single_number(nums)
