# Given the root of a binary tree, 
# imagine yourself standing on the right side of it, 
# return the values of the nodes you can see ordered from top to bottom.

# 
#        1
#      /  \
#     2    3
#      \    \
#       5    4

# Input: root = [1,2,3,null,5,null,4]
# Output: [1,3,4]

# Input: root = [1,null,3]
# Output: [1,3]

# Input: root = []
# Output: []


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
# @return {Integer[]}
def right_side_view(root)
  return [] if root.nil?
  queue = [root]
  result = []

  while !queue.empty? do
    right_side = nil

    queue.length.times do
      node = queue.shift
      
      if !node.nil?
        right_side = node
        queue.append node.left
        queue.append node.right
      end
    end
    if !right_side.nil?
      result.append right_side.val
    end
  end
  result
end

root = TreeNode.new(1, TreeNode.new(2, nil, TreeNode.new(5)), TreeNode.new(3, nil, TreeNode.new(4)))

p right_side_view(root)