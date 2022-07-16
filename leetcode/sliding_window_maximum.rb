# You are given an array of integers nums, 
# there is a sliding window of size k which is moving from the very left of the array to the very right. 
# You can only see the k numbers in the window. Each time the sliding window moves right by one position.

# Return the max sliding window.

# Example 1:

# Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
# Output: [3,3,5,5,6,7]
# Explanation: 
# Window position                Max
# ---------------               -----
# [1  3  -1] -3  5  3  6  7       3
#  1 [3  -1  -3] 5  3  6  7       3
#  1  3 [-1  -3  5] 3  6  7       5
#  1  3  -1 [-3  5  3] 6  7       5
#  1  3  -1  -3 [5  3  6] 7       6
#  1  3  -1  -3  5 [3  6  7]      7


# Example 2:

# Input: nums = [1], k = 1
# Output: [1]

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
# def max_sliding_window(nums, k)
#   left = 0
#   right = k-1

#   result = []
  
#   while right <= nums.length-1 do
#     result << nums[left..right].max
#     right += 1
#     left +=1
#   end
#   result
# end

def max_sliding_window(nums, k)
  return nums if k == 1
  left = 0
  deque = []
  result = []
  
  nums.count.times do |right|
    while !deque.empty? && nums[right] > nums[deque[-1]]
      deque.pop
    end
    
    deque << right

    if left > deque[0]
      deque.shift
    end

    if right+1 >= k
      result << nums[deque[0]]
      left += 1
    end
  end

  result
end


p max_sliding_window([1,3,-1,-3,5,3,6,7], 3)
p max_sliding_window([1], 1)
p max_sliding_window([1,-1], 1) # [1,-1]
p max_sliding_window([7,2,4], 2) # [7, 4]
p max_sliding_window([8,7,6,9], 2) # [8, 7, 9]
p max_sliding_window([1,3,1,2,0,5], 3) # [3,3,2,5]