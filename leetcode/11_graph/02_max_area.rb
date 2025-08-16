=begin
Max Area of Island

You are given an m x n binary matrix grid.
An island is a group of 1's (representing land) connected 4-directionally
(horizontal or vertical.) You may assume all four edges of the
grid are surrounded by water.

The area of an island is the number of cells
with a value 1 in the island.

Return the maximum area of an island in grid.
If there is no island, return 0

Input: grid = [
                [0,0,1,0,0,0,0,1,0,0,0,0,0],
                [0,0,0,0,0,0,0,1,1,1,0,0,0],
                [0,1,1,0,1,0,0,0,0,0,0,0,0],
                [0,1,0,0,1,1,0,0,1,0,1,0,0],
                [0,1,0,0,1,1,0,0,1,1,1,0,0],
                [0,0,0,0,0,0,0,0,0,0,1,0,0],
                [0,0,0,0,0,0,0,1,1,1,0,0,0],
                [0,0,0,0,0,0,0,1,1,0,0,0,0]
              ]
Output: 6
Explanation: The answer is not 11, because the island must be connected 4-directionally.
=end


def max_area_of_island(grid)
  max_counter = 0
  rows_length = grid.length
  cols_length = grid[0].length
  visited = Set.new

  dfs = ->(row, col) do
    if (row >= rows_length ||
        row < 0 ||
        col >= cols_length ||
        col < 0 ||
        visited.include?([row, col]) ||
        grid[row][col] == 0
      )
      return 0
    end

    visited.add([row, col])
     1 + (
            dfs.call(row + 1, col) +
            dfs.call(row - 1, col) +
            dfs.call(row, col + 1) +
            dfs.call(row, col - 1)
          )
  end

  rows_length.times do |row|
    cols_length.times do |col|
      if grid[row][col] == 1 && !visited.include?([row, col])
        current_counter = dfs.call(row, col)
        max_counter = [max_counter, current_counter].max
      end
    end
  end
  max_counter
end

grid = [
        [0,0,1,0,0,0,0,1,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,1,1,0,0,0],
        [0,1,1,0,1,0,0,0,0,0,0,0,0],
        [0,1,0,0,1,1,0,0,1,0,1,0,0],
        [0,1,0,0,1,1,0,0,1,1,1,0,0],
        [0,0,0,0,0,0,0,0,0,0,1,0,0],
        [0,0,0,0,0,0,0,1,1,1,0,0,0],
        [0,0,0,0,0,0,0,1,1,0,0,0,0]
      ]
p max_area_of_island(grid)
