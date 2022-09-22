#             6
#         /       \
#     2               8
#    /   \          /   \
# 0       4       7       9
#       /    \
#     3       5


# Given a binary search tree (BST), 
# find the lowest common ancestor (LCA) node of two given nodes in the BST.

# According to the definition of LCA on Wikipedia: 
# The lowest common ancestor is defined between two nodes p and q as the lowest node in T 
# that has both p and q as descendants (where we allow a node to be a descendant of itself).

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, pp, qq)
  while root do
    if pp.val < root.val && qq.val < root.val
      root = root.left
    elsif pp.val > root.val && qq.val > root.val
      root = root.right
    else
      return root
    end
  end 
end

p lowest_common_ancestor(root, pp, qq)