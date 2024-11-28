=begin

Subsets II

Given an integer array nums that may contain duplicates,
return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

Example 1:

Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]


=end

def subsets_with_dup(nums)
  nums = nums.sort
  result = []
  current = []

  decision = ->(counter) do
    if counter > nums.length-1
      result << current.dup
      return
    end

    current << nums[counter]
    decision.call(counter+1)

    while (counter < nums.length-1) && (nums[counter] == nums[counter+1]) do
      counter+=1
    end

    current.pop
    decision.call(counter+1)
  end
  decision.call(0)

  result
end

# nums = [1,2,2]
# nums = [5,5,5,5,5]
nums = [4,4,4,1,4]
p subsets_with_dup(nums)
