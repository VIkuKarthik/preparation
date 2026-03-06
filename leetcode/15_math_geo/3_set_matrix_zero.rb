=begin
  Given an m x n integer matrix matrix, if an element is 0,
  set its entire row and column to 0's.

  You must do it in place.
=end

def set_zeroes(matrix)
  rows = matrix.length
  cols = matrix[0].length
  row_zero = false

  (0...rows).each do |row|
    (0...cols).each do |col|
      if matrix[row][col] == 0
        matrix[0][col] = 0

        if row > 0
          matrix[row][0] = 0
        else
          row_zero = true
        end
      end
    end
  end

  (1...rows).each do |row|
    (1...cols).each do |col|
      if matrix[0][col] == 0 || matrix[row][0] == 0
        matrix[row][col] = 0
      end
    end
  end

  if matrix[0][0] == 0
    (0...rows).each do |row|
      matrix[row][0] = 0
    end
  end

  if row_zero
    (0...cols).each do |col|
      matrix[0][col] = 0
    end
  end
  matrix
end

matrix = [
          [1,1,1],
          [1,0,1],
          [1,1,1]
         ]
p set_zeroes(matrix)
