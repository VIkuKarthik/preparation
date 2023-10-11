=begin

https://leetcode.com/problems/diameter-of-binary-tree/description/

Given the root of a binary tree, return the length of the diameter of the tree.

The diameter of a binary tree is the length of the longest path between any two nodes in a tree. 
This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.

          1
    2         3
4       5

Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].

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

def diameter_of_binary_tree(root)
  @ans = 0
  height(root)
  @ans
end

def height(root)
  return -1 if root.nil?
  
  left = height(root.left)
  right = height(root.right)
  @ans = [@ans, left+right+2].max
  return 1 + [left, right].max
end


# tree = TreeNode.new(1, TreeNode.new(2, TreeNode.new(4), TreeNode.new(5)), TreeNode.new(3))
# tree_1 = TreeNode.new(1, TreeNode.new(2))
tree = TreeNode.new(1, 
  TreeNode.new(2, 
    TreeNode.new(4,
      TreeNode.new(8)
    ), 
    TreeNode.new(5, 
      TreeNode.new(6, 
        TreeNode.new(7)
      )
    )
  )
  
)

# tree = TreeNode.new(1, 
#   TreeNode.new(2, 
#     TreeNode.new(4),
#     TreeNode.new(5,
#       TreeNode.new(7,
#         TreeNode.new(8)
#       )
#     )
#   ),
#   TreeNode.new(3)
# )

p diameter_of_binary_tree(tree)