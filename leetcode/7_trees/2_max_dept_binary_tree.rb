=begin

https://leetcode.com/problems/maximum-depth-of-binary-tree/description/

      4
  2       7
1   3   6   9
          1   2

Output: 3

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
# @return {Integer}
def max_depth(root)
  max_level = 0
  dfs(root, 1, max_level)
end

def dfs(root, current_level, max_level)
  return nil unless root

  # puts max_level.inspect
  max_level = current_level if current_level > max_level
  dfs(root.left, current_level+1, max_level)
  dfs(root.right, current_level+1, max_level)
  max_level
end



# RECURSIVE FUNCTION
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 unless root

  return 1 + [max_depth(root.left), max_depth(root.right)].max
end


# BFS
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 unless root

  queue = [root]
  max_level = 0

  while !queue.empty? do
    queue.length.times do
      node = queue.shift
      queue.append(node.left) if node.left
      queue.append(node.right) if node.right
    end
    max_level += 1
  end
  max_level
end


# DFS
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  stack = [[root, 1]]
  max = 0

  while !stack.empty? do
    node, depth = stack.pop

    if node
      max = [max, depth].max
      stack.append([node.left, depth+1])
      stack.append([node.right, depth+1])
    end
  end
  max
end


# Bottom up solution
def max_depth(root)
  @depth = 0
  dfs(root)
  @depth
end

def dfs(root)
  return 0 if root.nil?

  left = dfs(root.left)
  right = dfs(root.right)
  @depth = 1 + [left, right].max
end


tree = TreeNode.new(4, 
  TreeNode.new(2, 
    TreeNode.new(1), 
    TreeNode.new(3)
  ), 
  TreeNode.new(7, 
    TreeNode.new(6), 
    TreeNode.new(9, 
      TreeNode.new(1), 
      TreeNode.new(2)
    )
  )
)

p max_depth(tree)