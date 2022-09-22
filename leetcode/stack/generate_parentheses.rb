# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

# Example 1:

# Input: n = 3
# Output: ["((()))","(()())","(())()","()(())","()()()"]
# Example 2:

# Input: n = 1
# Output: ["()"]


# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  res = []

  backtrack(n, '', 0, 0, res)

  res.inspect
end


def backtrack(n, str, open_count, close_count, res)
  if open_count < n
    backtrack(n, str+'(', open_count+1, close_count, res)
  end

  if open_count > close_count
    backtrack(n, str+')', open_count, close_count+1, res)
  end
  res << str if str.length == n *2
end

puts generate_parenthesis(5)