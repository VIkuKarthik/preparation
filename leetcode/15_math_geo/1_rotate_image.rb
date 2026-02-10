=begin
You are given an n x n 2D matrix representing an image,
rotate the image by 90 degrees (clockwise).

You have to rotate the image in-place,
which means you have to modify the input 2D matrix directly.
DO NOT allocate another 2D matrix and do the rotation.

Example: 1
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]

Example: 2
Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
=end


def rotate(matrix)
  left = 0
  right = matrix.length-1

  while left < right do
    top = left
    bottom = right

    (0..(right-left)-1).each do |counter|

      # save top left
      top_left = matrix[top][left + counter]

      # move bottom left to top left
      matrix[top][left + counter] = matrix[bottom - counter][left]

      # move bottom right to bottom left
      matrix[bottom - counter][left] = matrix[bottom][right - counter]

      # move top right to bottom right
      matrix[bottom][right - counter] = matrix[top + counter][right]

      # move top left to top right
      matrix[top + counter][right] = top_left
    end
    left += 1
    right -= 1
  end
  matrix
end



# Transpose algorithm
# Converting of Rows to Cols is Transpose.
def rotate(matrix)

  # Transpose
  length = matrix.length
  (0...length).each do |row|
    (0...row+1).each do |col|
      tmp = matrix[row][col]
      matrix[row][col] = matrix[col][row]
      matrix[col][row] = tmp
    end
  end

  # reverse
  (0...length).each do |counter|
    left = 0
    right = length - 1

    while left < right do
      temp = matrix[counter][left]
      matrix[counter][left] = matrix[counter][right];
      matrix[counter][right] = temp;

      left += 1
      right -= 1
    end
  end

  matrix
end

matrix = [
          [5,  1,  9,  11],
          [2,  4,  8,  10],
          [13, 3,  6,  7],
          [15, 14, 12, 16]
        ]

p rotate(matrix)
