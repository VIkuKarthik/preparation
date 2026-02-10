=begin
  Given an m x n matrix, return all elements of the matrix in spiral order.

  Example:
  Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
  Output: [1,2,3,6,9,8,7,4,5]

  Example:
  Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
  Output: [1,2,3,4,8,12,11,10,9,5,6,7]
=end


def spiral_order(matrix)
  result = []
  left = 0
  right = matrix[0].length
  top = 0
  bottom = matrix.length

  while left < right && top < bottom do

    # left to right
    (left...right).each do |counter|
      result << matrix[top][counter]
    end
    top += 1

    # top to bottom
    (top...bottom).each do |counter|
      result << matrix[counter][right-1]
    end
    right -= 1

    break unless (left < right) && (top < bottom)

    # bottom right to left
    (left...right).to_a.reverse.each do |counter|
      result << matrix[bottom-1][counter]
    end
    bottom -= 1

    # bottom to top
    (top...bottom).to_a.reverse.each do |counter|
      result << matrix[counter][left]
    end
    left += 1
  end
  result
end

# matrix = [
#           [1,2,3],
#           [4,5,6],
#           [7,8,9]
#         ]

matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]

p spiral_order(matrix)
