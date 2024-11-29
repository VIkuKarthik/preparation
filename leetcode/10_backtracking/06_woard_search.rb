require 'pry'

=begin

Word Search

Given an m x n grid of characters board and a string word,
return true if word exists in the grid.

The word can be constructed from letters of sequentially adjacent cells,
where adjacent cells are horizontally or vertically neighboring.
The same letter cell may not be used more than once.


Example:

Input:
board = [
          ["A","B","C","E"],
          ["S","F","C","S"],
          ["A","D","E","E"]
        ]
word = "ABCCED"

Output: true

=end

def exist(board, word)
  rows, cols = board.length, board[0].length
  path = Set.new

  dfs = ->(row, col, counter) do
    return true if counter == word.length

    if (
        row < 0 ||
        col < 0 ||
        row >= rows ||
        col >= cols ||
        word[counter] != board[row][col] ||
        path.include?([row, col])
      )
      return false
    end

    path.add([row, col])
    result = dfs.call(row + 1, col, counter+1) ||
              dfs.call(row - 1, col, counter+1) ||
              dfs.call(row, col + 1, counter+1) ||
              dfs.call(row, col - 1, counter+1)

    path.delete([row, col])
    return result
  end

  rows.times do |row|
    cols.times do |col|
      return true if dfs.call(row, col, 0)
    end
  end
  false
end

board = [
          ["A","B","C","E"],
          ["S","F","C","S"],
          ["A","D","E","E"]
        ]
word = "ABCCED"


board = [
          ["A","B","C","E"],
          ["S","F","C","S"],
          ["A","D","E","E"]
        ]
word = "SEE"

board = [
          ["A","B","C","E"],
          ["S","F","C","S"],
          ["A","D","E","E"]
        ]
word = "ABCB"

p exist(board, word)
