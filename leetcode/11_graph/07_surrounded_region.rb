=begin
Surrounded Regions

You are given an m x n matrix board containing letters 'X' and 'O',
capture regions that are surrounded:

-> Connect: A cell is connected to adjacent cells horizontally or vertically.
-> Region: To form a region connect every 'O' cell.
-> Surround: The region is surrounded with 'X' cells if you can connect
the region with 'X' cells and none of the region cells are on the edge of the board.

To capture a surrounded region, replace all 'O's with 'X's in-place
within the original board. You do not need to return anything.

Example:

Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]

Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
=end

def solve(board)
  rows_length = board.length
  cols_length = board[0].length

  # convert O to T
  dfs = ->(row, col) do
    if (row < 0 ||
        col < 0 ||
        row >= rows_length ||
        col >= cols_length ||
        board[row][col] != "O"
      )
      return
    end
    board[row][col] = "T"
    dfs.call(row + 1, col)
    dfs.call(row - 1, col)
    dfs.call(row, col + 1)
    dfs.call(row, col - 1)
  end

  # iterate row boarders (left and right)
  rows_length.times do |row|
    dfs.call(row, 0)
    dfs.call(row, cols_length - 1)
  end

  # iterate column boarders (top and botton)
  cols_length.times do |col|
    dfs.call(0, col)
    dfs.call(rows_length - 1, col)
  end

  # convert O to X
  rows_length.times do |row|
    cols_length.times do |col|
      if board[row][col] == "O"
        board[row][col] = "X"
      end
    end
  end

  # convert T to O
  rows_length.times do |row|
    cols_length.times do |col|
      if board[row][col] == "T"
        board[row][col] = "O"
      end
    end
  end
  board
end

# board = [
#           ["X","X","X","X"],
#           ["X","O","O","X"],
#           ["X","X","O","X"],
#           ["X","O","X","X"]
#         ]

# board = [
#           ["X","O","X"],
#           ["O","X","O"],
#           ["X","O","X"]
#         ]

# board = [
#           ["X","O"],
#           ["O","X"]
#         ]

board = [
          ["X","O","X","O","X","O"],
          ["O","X","O","X","O","X"],
          ["X","O","X","O","X","O"],
          ["O","X","O","X","O","X"]
        ]
p solve(board)
