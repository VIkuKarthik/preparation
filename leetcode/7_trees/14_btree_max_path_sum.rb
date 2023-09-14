=begin

A path in a binary tree is a sequence of nodes where 
each pair of adjacent nodes in the sequence has an edge connecting them. 
A node can only appear in the sequence at most once. 
Note that the path does not need to pass through the root.

The path sum of a path is the sum of the node's values in the path.

Given the root of a binary tree, return the maximum path sum of any non-empty path.

    -10
    / \
  9    20
      / \
     15  7     

Input: root = [-10,9,20,null,null,15,7]
Output: 42
Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.     

=end

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end


# @param {TreeNode} root
# @return {Integer}
def max_path_sum(root)
  @result = root.val
  dfs(root)
  @result
end

def dfs(root)
  return 0 unless root
  
  max_left = dfs(root.left)
  max_right = dfs(root.right)
  max_val = root.val + max_left + max_right

  @result = max_val if max_val > @result
  [ 0, root.val + max_left, root.val + max_right ].max
end

# 42
# root = TreeNode.new(-10,
#   TreeNode.new(9),
#   TreeNode.new(20,
#     TreeNode.new(15),
#     TreeNode.new(7)
#   )
# )

# 4
# root = TreeNode.new(1,
#   TreeNode.new(-2),
#   TreeNode.new(3)
# )

# 10
root = TreeNode.new(-1,
  TreeNode.new(-2,
    TreeNode.new(-6)
  ),
  TreeNode.new(10,
    TreeNode.new(-3),
    TreeNode.new(-6)
  )
)

p max_path_sum(root)  


=begin
# Using Lambda
def max_path_sum(root)
  result = root.val
  dfs = -> node do
    return 0 unless node

    max_left = dfs.call(node.left)
    max_right = dfs.call(node.right)
    current_val = max_left + max_right + node.val
    result = [result, current_val].max
    [0, node.val + max_left, node.val + max_right].max
  end
  dfs.call(root)
  result
end
=end