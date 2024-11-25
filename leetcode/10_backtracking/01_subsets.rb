=begin

Subsets

Given an integer array nums of unique elements, return all possible
subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.


Example 1:

Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
Example 2:

Input: nums = [0]
Output: [[],[0]]

=end

def subsets(nums)
  result = []
  subset = []

  decision = ->(counter) do
    if counter > nums.length-1
      result << subset.dup
      return
    end

    # decision to include
    subset << nums[counter]
    decision.call(counter+1)

    # decision not to include
    subset.pop
    decision.call(counter+1)
  end

  decision.call(0)
  result
end

nums = [1,2,3]
p subsets(nums)
