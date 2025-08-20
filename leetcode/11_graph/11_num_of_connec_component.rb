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
  rank = [0] * (n)

  compress = ->(node) do
    return node if (parent[node] == node)

    compress.call(parent[node])
  end

  connect = ->(ele1, ele2) do
    if rank[ele1] >= rank[ele2]
      parent[ele2] = ele1
      rank[ele1] += 1
      parent[ele2] = compress.call(ele2)
    else
      parent[ele1] = ele2
      rank[ele2] += 1
      parent[ele1] = compress.call(ele1)
    end
  end

  edges.each do |arr|
    connect.call(arr[0], arr[1])
  end

  p parent
  parent.group_by{|ele| ele}.count
end

# n=6
# edges=[[0,1], [1,2], [2,3], [4,5]]

# n=3
# edges = [[0,1], [0,2]]

n= 9
edges = [[0,1], [1,3], [2,4], [8,7], [7,6]]
p connected_component(n, edges)
