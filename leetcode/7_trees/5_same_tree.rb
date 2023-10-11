=begin

https://leetcode.com/problems/same-tree/description/

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

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(first_tree, second_tree)
  return true if (first_tree.nil? && second_tree.nil?)
  
  return false if (first_tree.nil? || second_tree.nil?)

  return false if (first_tree.val != second_tree.val)

  left = is_same_tree(first_tree.left, second_tree.left)
  right = is_same_tree(first_tree.right, second_tree.right)

  left && right
end

first = TreeNode.new(1, nil, TreeNode.new(2))
second = TreeNode.new(1, nil, TreeNode.new(2))

p is_same_tree(first, second)