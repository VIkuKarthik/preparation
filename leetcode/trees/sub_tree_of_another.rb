# Given the roots of two binary trees root and subRoot, 
# return true if there is a subtree of root with the same structure and 
# node values of subRoot and false otherwise.

# A subtree of a binary tree tree is a tree that consists of a node in tree and 
# all of this node's descendants. 
# The tree tree could also be considered as a subtree of itself.

#               3
#           /     \
#       4           5
#     /    \
#   1       2        


#         4
#      /     \
#   1           2      


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
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(root, sub_root)
  return true if sub_root.nil?

  return false if root.nil?

  return true if is_same_tree(root, sub_root)

  is_subtree(root.left, sub_root) || is_subtree(root.right, sub_root)
end

def is_same_tree(root, sub_root)
  return true if (root.nil? && sub_root.nil?)
  
  return false if (root.nil? || sub_root.nil?)
  
  return false if (root.val != sub_root.val)

  is_same_tree(root.left, sub_root.left) && is_same_tree(root.right, sub_root.right)
end

tree = TreeNode.new(3, TreeNode.new(4, TreeNode.new(1), TreeNode.new(2)), TreeNode.new(5))
sub_tree = TreeNode.new(4, TreeNode.new(1), TreeNode.new(2))

p is_subtree(tree, sub_tree)