=begin

https://leetcode.com/problems/longest-consecutive-sequence/

Given an unsorted array of integers nums, 
return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in O(n) time.

Example

Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements 
              sequence is [1, 2, 3, 4]. Therefore its length is 4.

Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9

=end

# ============== WITHOUT SORT ===============

# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  return 0 if nums.empty?
  hash = Hash.new{|h, k| h[k] = []}
  
  nums.each_with_index do |num, index|
    next if num == nums[index-1]
    _new = num-1
    if nums.include?(_new)
      hash[index] << num
      while nums.include?(_new) do
        hash[index] << _new
        _new -=1
      end
    end
  end
  hash.values.map(&:size).max || 1
end

# ============== WITH SORT ===============

def longest_consecutive(nums)
  return 0 if nums.empty?

  longest_seq = 1
  current_seq = 1
  nums = nums.sort

  (1..nums.length).each do |i|
    prev = nums[i - 1]
    curr = nums[i]

    next if curr == prev

    if curr == prev + 1
      current_seq += 1
      next
    end

    longest_seq = current_seq if current_seq > longest_seq
    current_seq = 1
  end

  longest_seq = current_seq if current_seq > longest_seq
  longest_seq
end

p longest_consecutive([100,4,200,1,3,2]) # 4
p longest_consecutive([0,3,7,2,5,8,4,6,0,1]) # 9
p longest_consecutive([]) # 0
p longest_consecutive([1,2,0,1]) # 3
p longest_consecutive([0]) # 1
p longest_consecutive([0,0]) # 1
p longest_consecutive([0,-1])  # 2
p longest_consecutive([4,0,-4,-2,2,5,2,0,-8,-8,-8,-8,-1,7,4,5,5,-4,6,6,-3])  # 5