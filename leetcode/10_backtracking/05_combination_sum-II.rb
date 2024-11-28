=begin

Combination Sum II


Given a collection of candidate numbers (candidates) and a target number (target),
find all unique combinations in candidates where the candidate numbers sum to target.

Each number in candidates may only be used once in the combination.

Note: The solution set must not contain duplicate combinations.


Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: [ [1,1,6], [1,2,5], [1,7], [2,6] ]


=end

def combination_sum2(candidates, target)
  candidates = candidates.sort
  result = []

  decision = ->(counter, current, total) do
    if total == target
      result << current.dup
      return
    end

    return if (counter > candidates.length-1) || (total > target)

    current << candidates[counter]
    decision.call(counter+1, current, total + candidates[counter])

    while counter < candidates.length-1 && candidates[counter] == candidates[counter+1] do
      counter += 1
    end

    current.pop
    decision.call(counter+1, current, total)
  end
  decision.call(0, [], 0)
  result
end

# candidates = [10,1,2,7,6,1,5]
# target = 8

candidates = [2,5,2,1,2]
target = 5

p combination_sum2(candidates, target)
