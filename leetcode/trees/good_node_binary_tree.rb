
# Given a binary tree root, a node X in the tree is named good if in the path 
# from root to X there are no nodes with a value greater than X.

# Return the number of good nodes in the binary tree.



#           3
#         /  \
#       1     4
#     /      / \
#   3       1   5



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
def good_nodes(root)
  @result = 0
  dfs(root, root.val)
end

def dfs(node, max_val)
  return 0 if node.nil?

  res = (node.val >= max_val) ? 1 : 0
  max_val = [node.val, max_val].max
  res += dfs(node.left, max_val)
  res += dfs(node.right, max_val)
end

root = TreeNode.new(3, TreeNode.new(1, TreeNode.new(3)), TreeNode.new(4, TreeNode.new(1), TreeNode.new(5)))

p good_nodes(root)