=begin
  Min Cost to Connect All Points

  You are given an array points representing integer
  coordinates of some points on a 2D-plane, where points[i] = [xi, yi].

  The cost of connecting two points [xi, yi] and [xj, yj] is
  the manhattan distance between them: |xi - xj| + |yi - yj|,
  where |val| denotes the absolute value of val.

  Return the minimum cost to make all points connected. All points are
  connected if there is exactly one simple path between any two points.

  Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
  Output: 20
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

def min_cost_connect_points(points)
  manhattan_distance = ->(x1, y1, x2, y2) do
    ((x1 - x2).abs + (y1 - y2).abs)
  end

  hash = Hash.new{|h, k| h[k] = []}

  points.each_with_index do |point, index|
    ((index+1)...points.length).each do |counter|
      cost = manhattan_distance.call(point[0], point[1], points[counter][0], points[counter][1])
      hash[index] << [cost, counter]
      hash[counter] << [cost, index]
    end
  end

  heap = MinHeap.new
  heap.push([0, 0])
  visited = Set.new
  result = 0

  while !heap.empty? && visited.size != points.length do
    cost, neigh = heap.pop

    next if visited.include?(neigh)

    result += cost
    visited.add(neigh)

    hash[neigh].each do |cost, cord|
      heap.push([cost, cord]) unless visited.include?(cord)
    end
  end
  result
end

# points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
# points = [[3,12],[-2,5],[-4,1]]
points = [[0,0],[1,1],[1,0],[-1,1]] # 4
p min_cost_connect_points(points)
