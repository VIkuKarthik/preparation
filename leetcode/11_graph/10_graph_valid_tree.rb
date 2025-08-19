=begin
Graph Valid Tree

Given n nodes labeled from 0 to n - 1 and a list of
undirected edges (each edge is a pair of nodes),
write a function to check whether these edges make up a valid tree.

Example: 1
Input:
n = 5
edges = [[0, 1], [0, 2], [0, 3], [1, 4]]

Output:
true

Example: 2
Input:
n = 5
edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]]

Output:
false
=end


def valid_tree(n, edges)
  adj = Hash.new {|h, k| h[k] = []}
  visited = Set.new

  edges.each do |arr|
    adj[arr[0]] << arr[1]
    adj[arr[1]] << arr[0]
  end

  dfs = ->(node, prev) do
    return false if visited.include?(node)

    visited.add(node)

    adj[node].each do |neighbour|
      next if neighbour == prev
      return false unless dfs.call(neighbour, node)
    end
    true
  end

  dfs.call(0, -1) && visited.size == n
end

# n = 5
# edges = [[0, 1], [0, 2], [0, 3], [1, 4]]

n = 5
edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]]
p valid_tree(n, edges)
