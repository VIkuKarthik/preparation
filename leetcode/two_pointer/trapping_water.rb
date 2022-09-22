# https://leetcode.com/problems/trapping-rain-water/


# Given n non-negative integers representing an elevation map where the width of each bar is 1, 
# compute how much water it can trap after raining.

# Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
# Output: 6
# Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. 
# In this case, 6 units of rain water (blue section) are being trapped.

# @param {Integer[]} height
# @return {Integer}
def trap(height)
  water_units = 0
  pointer_a = 0
  pointer_b = height.length - 1
  max_left = height[pointer_a]
  max_right = height[pointer_b]

  while pointer_a < pointer_b do
    if max_left < max_right
      pointer_a += 1
      max_left = [height[pointer_a], max_left].max
      water_units += max_left - height[pointer_a]
    else
      pointer_b -= 1
      max_right = [height[pointer_b], max_right].max
      water_units += max_right - height[pointer_b]
    end
  end
  water_units
end

p trap([0,1,0,2,1,0,1,3,2,1,2,1])