=begin

https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/

Given two integer arrays preorder and inorder 
where preorder is the preorder traversal of a binary tree and 
inorder is the inorder traversal of the same tree, construct and return the binary tree.

      3
    /   \
  9      20
        /  \
      15    7

Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]

Input: preorder = [-1], inorder = [-1]
Output: [-1]      

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



# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return [] if inorder.empty? || preorder.empty?

  root_index = inorder.index(preorder.shift)
  
  root = TreeNode.new(inorder[root_index])
  left = inorder[0...root_index]
  root.left = build_tree(preorder[0, left.length], left)
  right = inorder[(root_index+1)..-1]
  root.right = build_tree(preorder[left.length, right.length], right)
  root
end

# build_tree(PREORDER, INORDER)
p build_tree([3,9,20,15,7], [9,3,15,20,7])