require 'pry'
=begin

N-Queens

The n-queens puzzle is the problem of placing n queens on an n x n
chessboard such that no two queens attack each other.

Given an integer n, return all distinct solutions to the n-queens puzzle.
You may return the answer in any order.

Each solution contains a distinct board configuration of the n-queens' placement,
where 'Q' and '.' both indicate a queen and an empty space, respectively.

Example 1:

Input: n = 4
Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above

=end


def solve_n_queens(n)
  result = []
  cols = Set.new
  pos_diag = Set.new
  neg_diag = Set.new

  board = Array.new(n) { Array.new(n) { "." } }

  dfs = ->(row) do
    if row == n
      result << board.map(&:join)
      return
    end

    n.times do |col|
      next if cols.include?(col) || pos_diag.include?(row + col) || neg_diag.include?(row - col)

      cols.add(col)
      pos_diag.add(row + col)
      neg_diag.add(row - col)
      board[row][col] = "Q"
      dfs.call(row + 1)

      cols.delete(col)
      pos_diag.delete(row + col)
      neg_diag.delete(row - col)
      board[row][col] = "."
    end
  end

  dfs.call(0)
  return result
end

n = 4
p solve_n_queens(n)
