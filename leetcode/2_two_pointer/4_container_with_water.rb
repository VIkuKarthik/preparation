=begin

https://leetcode.com/problems/container-with-most-water/

You are given an integer array height of length n. 
There are n vertical lines drawn such that the two 
endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, 
such that the container contains the most water.

Return the maximum amount of water a container can store.

Example

Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49

Explanation: The above vertical lines are represented by array 
[1,8,6,2,5,4,8,3,7]. In this case, the max area of 
water (blue section) the container can contain is 49.


Input: height = [1,1]
Output: 1

=end


# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  lookup = []

  pointer_a = 0
  pointer_b = (height.length) - 1

  while pointer_a < pointer_b do

    min = [ height[pointer_a], height[pointer_b] ].min
    diff = (pointer_a - pointer_b).abs
    
    lookup << diff*min

    if height[pointer_a] < height[pointer_b]
      pointer_a += 1
    else
      pointer_b -= 1
    end
  end
  lookup.max
end


puts max_area([1,8,6,2,5,4,8,3,7])
puts max_area([1,1])