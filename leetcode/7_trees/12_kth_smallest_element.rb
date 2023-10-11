=begin

https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/

Given the root of a binary search tree, and an integer k, 
return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

    3
  /   \
1      4
\
  2

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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  stack = []
  counter = 0

  while root || stack do
    while root do
      stack << root
      root = root.left
    end
    root = stack.pop
    counter += 1
    return root.val if counter == k
    
    root = root.right
  end
end 

# tree = TreeNode.new(3,
#   TreeNode.new(1,
#     nil,
#     TreeNode.new(2)
#   ),
#   TreeNode.new(4)
# )


tree = TreeNode.new(5,
  TreeNode.new(3,
    TreeNode.new(2,
      TreeNode.new(1)
    ),
    TreeNode.new(4)
  ),
  TreeNode.new(6)
)

p kth_smallest(tree, 3)