require 'pry'
=begin

Serialization is the process of converting a data structure or 
object into a sequence of bits so that it can be stored in a file or 
memory buffer, or transmitted across a network connection link 
to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a binary tree. 
There is no restriction on how your 
serialization/deserialization algorithm should work. 
You just need to ensure that a binary tree can be serialized 
to a string and this string can be deserialized 
to the original tree structure.

Clarification: The input/output format is the same as how 
LeetCode serializes a binary tree. 
You do not necessarily need to follow this format, 
so please be creative and come up with different approaches yourself.


    1
  /   \
 2     3
      / \
     4   5

Input: root = [1,2,3,null,null,4,5]
Output: [1,2,3,null,null,4,5]     

=end


# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left, @right = left, right
  end
end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
  result = []
  dfs = -> node do
    if node
      result << "#{node.val}"
    else
      result << "#"
      return
    end
    dfs.call(node.left)
    dfs.call(node.right)
  end
  dfs.call(root)
  result.join(",")
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  pointer = 0
  vals = data.split(',')

  dfs = -> do
    if vals[pointer] == "#"
      pointer += 1
      return
    end

    node = TreeNode.new(vals[pointer].to_i)
    pointer += 1
    node.left = dfs.call
    node.right = dfs.call
    return node
  end
  dfs.call
end

# Your functions will be called as such:
# deserialize(serialize(data))

root = TreeNode.new(1,
  TreeNode.new(2),
  TreeNode.new(3,
    TreeNode.new(4),
    TreeNode.new(5)
  )
)

serialize = serialize(root)
deserialize = deserialize(serialize)
p "serialize => #{serialize}, deserialize => #{deserialize}"