=begin

https://leetcode.com/problems/largest-rectangle-in-histogram/description/

Given an array of integers heights representing the 
histogram's bar height where the width of each bar is 1, 
return the area of the largest rectangle in the histogram.

Example:

Input: heights = [2,1,5,6,2,3]
Output: 10
Explanation: The above is a histogram where width of each bar is 1.
The largest rectangle is shown in the red area, which has an area = 10 units

Input: heights = [2,4]
Output: 4

=end

# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  stack = []
  largest = 0
  
  heights.each_with_index do |height, index|
    
    while !stack.empty? && stack[-1][1] > height
      last = stack.pop
      largest = [largest, (index - last[0])*last[1]].max
    end
    
    stack <<  (last ? [last[0], height] : [index, height])
  end
  
  until stack.empty?
    heights_length = heights.length
    
    last = stack.pop
    largest = [largest, (heights_length - last[0])*last[1]].max
  end
  
  largest
end

puts largest_rectangle_area([2,1,5,6,2,3])
puts largest_rectangle_area([2,4])