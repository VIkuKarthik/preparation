# Given the root of a binary tree, 
# return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

#   
#       3
#     /   \
#   9      20
#         /   \
#       15     7

# Input: root = [3,9,20,null,null,15,7]
# Output: [[3],[9,20],[15,7]]

# Input: root = [1]
# Output: [[1]]

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
# @return {Integer[][]}

# Solution 1
def level_order(root)
  return [] if root.nil?
  queue = [[root, 1]]
  result = Hash.new{|h, k| h[k] = []}

  while !queue.empty? do
    node_ar = queue.pop
    result[node_ar[1]] << node_ar[0].val
    queue.unshift([node_ar[0].left, node_ar[1]+1]) if node_ar[0].left
    queue.unshift([node_ar[0].right, node_ar[1]+1]) if node_ar[0].right
  end
  result.values
end


# Solution 2
def level_order(root)
  result = []
  queue = []
  queue.append root

  while !queue.empty? do
    level = []
    queue.length.times do
      node = queue.shift
      if !node.nil?
        level.append node.val
        queue.append node.left
        queue.append node.right
      end
    end
    result.append level if !level.empty?
  end
  result
end

root = TreeNode.new(3, TreeNode.new(9), TreeNode.new(20, TreeNode.new(15), TreeNode.new(7)))

p level_order(root)