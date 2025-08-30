require 'pry'
=begin
Network Delay Time

You are given a network of n nodes, labeled from 1 to n.
You are also given times, a list of travel times as directed edges
times[i] = (ui, vi, wi), where ui is the source node, vi is the target node,
and wi is the time it takes for a signal to travel from source to target.

We will send a signal from a given node k.
Return the minimum time it takes for all the n nodes to receive the signal.
If it is impossible for all the n nodes to receive the signal, return -1.


Input: times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2
Output: 2
=end

class MinHeap
	attr_accessor :data

	def initialize
		@data = []
	end

	def push(val)
		data.push(val)
		parent_index = parent(data.length-1)
		compare_up(parent_index)
	end

	def pop
		return nil if data.length == 0
    return data.pop if data.length == 1

		smallest_value = data[0]
		data[0] = data.pop
		compare_down(0)

		smallest_value
	end

  def empty?
    data.empty?
  end

	private

	def compare_up(parent_index)
		head = heapify(parent_index)

		compare_up(parent(parent_index)) if head && parent_index > 0
	end

	def compare_down(parent_index)
		head = heapify(parent_index)

		compare_down(head) if head
	end

	def heapify(parent_index)
		left_index = left(parent_index)
		right_index = right(parent_index)

		head = parent_index
		head = left_index if data[left_index] && data[left_index][0] < data[head][0]
		head = right_index if data[right_index] && data[right_index][0] < data[head][0]

		return if head == parent_index

		data[parent_index], data[head] = data[head], data[parent_index]
		head
	end

	def left(index)
		2 * index + 1
	end

	def right(index)
		2 * index + 2
	end

	def parent(index)
		(index - 1) / 2
	end
end

def network_delay_time(times, n, k)
  adj = Hash.new {|h, k| h[k] = []}

  times.each do |source, target, time|
    adj[source] << [time, target]
  end

  heap = MinHeap.new
  visited = Set.new
  time = 0

  heap.push([0, k])

  while !heap.empty? do
    t, node = heap.pop
    next if visited.include?(node)

    visited.add(node)
    time = t
    adj[node].each do |edge|
      if !visited.include?(edge[1])
        heap.push([edge[0] + time, edge[1]])
      end
    end
  end
  return time if visited.length == n
  -1
end

times = [[2,1,1],[2,3,1],[3,4,1]]
n = 4
k = 2

# times = [[1,2,1]]
# n = 2
# k = 1

p network_delay_time(times, n, k)
