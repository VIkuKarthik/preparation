=begin
Redundant Connection

In this problem, a tree is an undirected graph that is connected and has no cycles.

You are given a graph that started as a tree with n nodes labeled from 1 to n,
with one additional edge added. The added edge has two different vertices chosen from 1 to n,
and was not an edge that already existed. The graph is represented as an array
edges of length n where edges[i] = [ai, bi] indicates that there
is an edge between nodes ai and bi in the graph.


Return an edge that can be removed so that the resulting graph is a tree of n nodes.
If there are multiple answers,
return the answer that occurs last in the input.

Example:
Input: edges = [[1,2],[1,3],[2,3]]
Output: [2,3]

Example:
Input: edges = [[1,2],[2,3],[3,4],[1,4],[1,5]]
Output: [1,4]
=end


def find_redundant_connection(edges)
  parent = (0..edges.length).to_a
  rank = [1] * (edges.length+1)

  find = ->(node) do
    if node != parent[node]
      node = find.call(parent[node])
    end
    node
  end

  connect = ->(n1, n2) do
    node1 = find.call(n1)
    node2 = find.call(n2)

    return false if parent[node1] == parent[node2]

    if rank[node1] > rank[node2]
      parent[node2] = node1
      rank[node1] += rank[node2]
    else
      parent[node1] = node2
      rank[node2] += rank[node1]
    end
    true
  end

  edges.each do |nodes|
    return nodes unless connect.call(nodes[0], nodes[1])
  end
end

# edges = [[1,2],[1,3],[2,3]]
edges = [[1,4],[3,4],[1,3],[1,2],[4,5]] # [1,3]
p find_redundant_connection(edges)
