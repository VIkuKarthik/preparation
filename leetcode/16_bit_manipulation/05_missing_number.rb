=begin
  Given two integers a and b, return the sum of
  the two integers without using
  the operators + and -.

  Example 1:

  Input: a = 1, b = 2
  Output: 3

  Example 2:

  Input: a = 2, b = 3
  Output: 5
=end

def missing_number(nums)
  total = nums.length

  (nums.length).times do |counter|
    total += counter - nums[counter]
  end
  total
end


nums = [4,0,1,2]
p missing_number(nums)
