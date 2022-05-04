# Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. 
# This matrix has the following properties:

# Integers in each row are sorted from left to right.
# The first integer of each row is greater than the last integer of the previous row.


# Example 1:

# Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
# Output: true

# Example 2:

# Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
# Output: false

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)

  p_total = matrix.length-1
  left_pointer = 0
  right_pointer = p_total
  
  while left_pointer <= right_pointer do
    p_middle = (left_pointer + right_pointer) / 2
    
    if (matrix[p_middle][0] <= target) and (matrix[p_middle][-1] >= target)
      # current
      left_pointer, right_pointer = 0, matrix[p_middle].length-1

      while matrix[p_middle][left_pointer] <= matrix[p_middle][right_pointer] do
        middle_pointer = (left_pointer + right_pointer) / 2
        if matrix[p_middle][middle_pointer] == target
          return true
        elsif matrix[p_middle][middle_pointer] > target
          # right
          right_pointer -= 1
        else
          # left
          left_pointer += 1
        end
      end
      
    elsif (matrix[p_middle][0] > target) and (matrix[p_middle][-1] > target)
      # left
      right_pointer -= 1
    else
      # right
      left_pointer += 1
    end
  end
  false
end

puts search_matrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 60)