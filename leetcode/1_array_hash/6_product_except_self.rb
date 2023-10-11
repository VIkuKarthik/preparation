=begin

https://leetcode.com/problems/product-of-array-except-self/

Given an integer array nums, return an array answer 
such that answer[i] is equal to the product of all the elements 
of nums except nums[i].

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in O(n) time and without using the division operation.

Example:

Input: nums = [1,2,3,4]
Output: [24,12,8,6]

Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]


----------- HINT -----------
[1,2,3,4]

set prefix and postfix as 1

1) push the prefix into array and update the prefix 
value by multiplying with the input element

2) [reverse the array] multiply the postfix from the end (input length) 
on existing array and update the postfix value by 
multiplying with the input element


      1   2   3   4                 -> Input

      1   1   2   6   24            -> Prefix (will be started from 0th index from input array)
24    24  12  4   1                 -> Postfix (will be started from nth index from input array)
---------------------------------
      24  12  8   6                 -> Result
---------------------------------

=end


# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    res = []
    left = []
    right = []

    prefix = 1
    nums.each_with_index do |num, index|
      left <<  prefix * num
      prefix = prefix * num
    end

    postfix = 1
    nums.reverse_each do |num, index|
      right.unshift(postfix * num)
      postfix = postfix * num
    end

    nums.each_with_index do |num, index|
      if (index == 0)
        res << 1 * right[(index+1)].to_i
      elsif index == nums.length-1
        res << left[(index - 1).to_i.abs] * 1
      else
        res << left[(index - 1).to_i.abs] * right[(index+1)].to_i
      end
    end
    res
end


# Method Two Inplace

def product_except_self(nums)
  res = []

  prefix = 1
  nums.each_with_index do |num, index|
    res[index] = prefix
    prefix *= num
  end

  postfix = 1
  nums.reverse.each_with_index do |num, index|
    res[(nums.length-1) - index] *= postfix
    postfix *= num
  end
  res
end

p product_except_self([1,2,3,4])
p product_except_self([-1,1,0,-3,3])
p product_except_self([0,0])
p product_except_self([1,1])
p product_except_self([1,2,3,4])  # [24,12,8,6]
p product_except_self([1,-1])    # [-1, 1]