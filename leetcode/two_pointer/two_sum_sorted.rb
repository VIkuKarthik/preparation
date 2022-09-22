# Example 1:

# Input: numbers = [2,7,11,15], target = 9
# Output: [1,2]
# Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].

# Example 2:

# Input: numbers = [2,3,4], target = 6
# Output: [1,3]
# Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].

# Example 3:

# Input: numbers = [-1,0], target = -1
# Output: [1,2]
# Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  b = numbers.length
  a = 1
  res = []
  
  (1..numbers.length).to_a.each do |index|
    puts "numbers[index] => #{numbers[a-1]} | numbers[b] => #{numbers[b-1]} => #{(numbers[a-1] + numbers[b-1])}"
    return [ a, b ].inspect if (numbers[a-1] + numbers[b-1]) == target

    if (numbers[a-1] + numbers[b-1]) > target
      b -= 1
    else
      a += 1
    end
  end
  false
end

puts two_sum([2,3,4], 6)
puts two_sum([-1,0], -1)
puts two_sum([2,7,11,15], 9)
puts two_sum([1,2,3,4,4,9,56,90], 8)
