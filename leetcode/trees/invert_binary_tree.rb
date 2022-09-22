# Invert Binary Tree

#       4
#   2       7
# 1   3   6   9

#       TO

#       4
#   7       2
# 9   6   3   1

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
# @return {TreeNode}
def invert_tree(root)
  return nil unless root

  tmp = root.left
  root.left = root.right
  root.right = tmp

  invert_tree(root.left)
  invert_tree(root.right)
  root
end


tree = TreeNode.new(4, TreeNode.new(2, TreeNode.new(1), TreeNode.new(3)), TreeNode.new(7, TreeNode.new(6), TreeNode.new(9)))


puts invert_tree(tree).inspect
