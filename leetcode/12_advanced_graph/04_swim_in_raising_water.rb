require 'pry'

=begin
Swim in Rising Water

You are given an n x n integer matrix grid where each
value grid[i][j] represents the elevation at that point (i, j).

It starts raining, and water gradually rises over time.
At time t, the water level is t, meaning any cell with elevation less than equal to t is submerged or reachable.

You can swim from a square to another 4-directionally
adjacent square if and only if the elevation of both squares individually are at most t. You can swim infinite distances in zero time. Of course, you must stay within the boundaries of the grid during your swim.

Return the minimum time until you can reach the bottom
right square (n - 1, n - 1) if you start at the top left square (0, 0).


Input: grid = [[0,2],[1,3]]
Output: 3
Explanation:
At time 0, you are in grid location (0, 0).
You cannot go anywhere else because 4-directionally adjacent neighbors have a higher elevation than t = 0.
You cannot reach point (1, 1) until time 3.
When the depth of water is 3, we can swim anywhere inside the grid.

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


def swim_in_water(grid)
  visited = Set.new
  heap = MinHeap.new
  heap.push([grid[0][0], 0, 0])

  dir = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  while !heap.empty? do
    time, row, col = heap.pop

    if row == grid.length-1 && col == grid.length-1
      return time
    end

    dir.each do |dr, dc|
      neigh_row, neigh_col = row + dr, col + dc

      if (
          neigh_row < 0 ||
          neigh_col < 0 ||
          neigh_row == grid.length ||
          neigh_col == grid.length ||
          visited.include?([neigh_row, neigh_col])
        )
        next
      end
      visited.add([neigh_row, neigh_col])
      max_time = [time, grid[neigh_row][neigh_col]].max
      heap.push([max_time, neigh_row, neigh_col])
    end
  end

  time
end

# grid = [[0,2],[1,3]]
# grid = [[0,1,2,3,4],[24,23,22,21,5],[12,13,14,15,16],[11,17,18,19,20],[10,9,8,7,6]]
grid = [[3,2],[0,1]] # 3
p swim_in_water(grid)
