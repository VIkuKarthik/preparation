# Input: height = [1,8,6,2,5,4,8,3,7]
# Output: 49

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  length = height.length
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