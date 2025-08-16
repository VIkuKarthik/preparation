=begin
Rotting Oranges

You are given an m x n grid where each cell can have one of three values:

->  0 representing an empty cell,
->  1 representing a fresh orange, or
->  2 representing a rotten orange.

Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange.
If this is impossible, return -1.

Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
Output: 4
=end


def oranges_rotting(grid)
  queue = []
  rows_length = grid.length
  cols_length = grid[0].length
  max_days = 0
  fresh = 0

  rows_length.times do |row|
    cols_length.times do |col|
      if grid[row][col] == 2
        queue.append([row, col])
      elsif grid[row][col] == 1
        fresh += 1
      end
    end
  end

  add_fresh = ->(row, col) do
    if (row >= rows_length ||
        row < 0 ||
        col >= cols_length ||
        col < 0 ||
        [0, 2].include?(grid[row][col])
      )
      return
    end
    grid[row][col] = 2
    queue.append([row, col])
    fresh -= 1
  end

  while !queue.empty? && fresh > 0 do
    queue.length.times do
      row, col = queue.shift
      add_fresh.call(row + 1, col)
      add_fresh.call(row - 1 , col)
      add_fresh.call(row, col + 1)
      add_fresh.call(row, col - 1)
    end
    max_days += 1
  end

  return -1 if fresh > 0
  return max_days
end

# grid = [[2,1,1],[1,1,0],[0,1,1]]
grid = [[2,1,1],[0,1,1],[1,0,1]]

p oranges_rotting(grid)
