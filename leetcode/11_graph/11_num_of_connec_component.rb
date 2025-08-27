=begin
Number of Connected Components in an Undirected Graph

There is an undirected graph with n nodes. There is also an edges array,
where edges[i] = [a, b] means that there is an edge between
node a and node b in the graph.

The nodes are numbered from 0 to n - 1.

Return the total number of connected components in that graph.

Example: 1
Input:
n=3
edges=[[0,1], [0,2]]

Output:
1

Example: 2
Input:
n=6
edges=[[0,1], [1,2], [2,3], [4,5]]

Output:
2
=end


def connected_component(n, edges)
  parent = (0..n-1).to_a
  rank = [1] * (n)

  find = ->(node) do
    res = node

    while res != parent[res] do
      parent[res] = parent[parent[res]] # path compression
      res = parent[res]
    end
    res
  end


  connect = ->(ele1, ele2) do
    node1 = find.call(ele1)
    node2 = find.call(ele2)


    return 0 if node1 == node2

    if rank[node2] > rank[node1]
      parent[node1] = node2
      rank[node2] += rank[node1]
    else
      parent[node2] = node1
      rank[node1] += rank[node2]
    end
    return 1
  end

  result = n
  edges.each do |arr|
    result -= connect.call(arr[0], arr[1])
  end

  result
end

n=6
edges=[[0,1], [1,2], [2,3], [4,5]]

# n=3
# edges = [[0,1], [0,2]]

# n= 9
# edges = [[0,1], [1,3], [2,4], [8,7], [7,6]]
p connected_component(n, edges)
