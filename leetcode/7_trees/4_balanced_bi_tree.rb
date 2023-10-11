=begin

https://leetcode.com/problems/balanced-binary-tree/description/

    3
9       20
     15    7


          1
    2         3
4       5
     
Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as:

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
# @return {Boolean}
def is_balanced(root)
  return dfs(root)[0]
end

def dfs(root)
  return [true, 0] if root.nil?

  left, right = dfs(root.left), dfs(root.right)
  ab_val = ((left[1] - right[1]).abs) <= 1
  bal = (left[0]) && (right[0]) && (ab_val)

  return [ bal, (1 + [left[1], right[1]].max) ]
end




# tree = TreeNode.new(1, TreeNode.new(2, TreeNode.new(4), TreeNode.new(5, TreeNode.new(10))), TreeNode.new(3))
# tree = TreeNode.new(1, TreeNode.new(2))
tree = TreeNode.new(1, TreeNode.new(2, TreeNode.new(3, TreeNode.new(4), TreeNode.new(4)), TreeNode.new(3)), TreeNode.new(2))



p is_balanced(tree)