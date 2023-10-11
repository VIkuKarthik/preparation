=begin

https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

Given a 1-indexed array of integers numbers that is 
already sorted in non-decreasing order, find two numbers such that 
they add up to a specific target number. 
Let these two numbers be numbers[index1] and numbers[index2] 
where 1 <= index1 < index2 < numbers.length.

Return the indices of the two numbers, index1 and index2, 
added by one as an integer array [index1, index2] of length 2.

The tests are generated such that there is exactly one solution. 
You may not use the same element twice.

Your solution must use only constant extra space.

Example 1:

Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. 
Therefore, index1 = 1, index2 = 2. We return [1, 2].

Input: numbers = [2,3,4], target = 6
Output: [1,3]
Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].


=end

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  b = numbers.length
  a = 1
  res = []
  
  (1..numbers.length).to_a.each do |index|
    return [ a, b ] if (numbers[a-1] + numbers[b-1]) == target

    if (numbers[a-1] + numbers[b-1]) > target
      b -= 1
    else
      a += 1
    end
  end
  false
end

p two_sum([2,3,4], 6)
p two_sum([-1,0], -1)
p two_sum([2,7,11,15], 9)
p two_sum([1,2,3,4,4,9,56,90], 8)
