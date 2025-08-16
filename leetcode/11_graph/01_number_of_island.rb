=begin
Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water),
return the number of islands.

An island is surrounded by water and is formed by connecting adjacent
lands horizontally or vertically. You may assume all four edges of the
grid are all surrounded by water.

Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1

=end


def number_island(grid)
  visited = Set.new
  max_counter = 0

  rows_length = grid.length
  cols_length = grid[0].length

  dfs = ->(row, col) do
    if (row >= rows_length ||
        row < 0 ||
        col >= cols_length ||
        col < 0 ||
        visited.include?([row, col]) ||
        grid[row][col] != '1'
      )
      return
    end
    visited.add([row, col])

    dfs.call(row + 1, col) ||
    dfs.call(row - 1, col) ||
    dfs.call(row, col + 1) ||
    dfs.call(row, col - 1)
  end

  rows_length.times do |row|
    cols_length.times do |col|
      if (grid[row][col] == '1') && (!visited.include?([row, col]))
        dfs.call(row, col)
        max_counter += 1
      end
    end
  end
  max_counter
end

grid =  [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]

p number_island(grid)
