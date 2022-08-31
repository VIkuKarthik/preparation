# A valid BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than the node's key.
# The right subtree of a node contains only nodes with keys greater than the node's key.
# Both the left and right subtrees must also be binary search trees.

# 
#       5
#     /   \
#   1      4
#         / \
#        3   6

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
# @return {Boolean}
def is_valid_bst(root)
  valid(root, -(Float::INFINITY), (Float::INFINITY))
end

def valid(node, left, right)
  return true if node.nil?

  return false unless ((node.val < right) && (node.val > left))

  valid(node.left, left, node.val) && valid(node.right, node.val, right)
end

root = TreeNode.new(5, TreeNode.new(1), TreeNode.new(7, TreeNode.new(6), TreeNode.new(8)))

p is_valid_bst(root)