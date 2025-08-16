=begin
Clone Graph

Given a reference of a node in a connected undirected graph.

Return a deep copy (clone) of the graph.

Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.

class Node {
    public int val;
    public List<Node> neighbors;
}

Test case format:

For simplicity, each node's value is the same as the node's index (1-indexed).
For example, the first node with val == 1, the second node with val == 2, and so on.
The graph is represented in the test case using an adjacency list.

An adjacency list is a collection of unordered lists used to
represent a finite graph. Each list describes the set
of neighbors of a node in the graph.

The given node will always be the first node with val = 1.
You must return the copy of the given node as a reference
to the cloned graph.



Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]

Explanation: There are 4 nodes in the graph.
1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).

=end


class Node
  attr_accessor :val, :neighbors

  def initialize(val = 0, neighbors = nil)
    @val = val
    neighbors = [] if neighbors.nil?
    @neighbors = neighbors
  end
end

def cloneGraph(node)
  hash = {}

  dfs = ->(node) do
    return hash[node] if hash.key?(node) # return the copy if already exists

    copy = Node.new(node.val)
    hash[node] = copy # make a copy

    node.neighbors.each do |neighbor|
      copy.neighbors.append(dfs.call(neighbor)) # append neighbors
    end
    copy
  end

  dfs.call(node) if node
end

node = [[2,4],[1,3],[2,4],[1,3]]
p cloneGraph(node)
