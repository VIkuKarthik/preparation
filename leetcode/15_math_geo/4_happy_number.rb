=begin
  Write an algorithm to determine if a number n is happy.

  A happy number is a number defined by the following process:

  * Starting with any positive integer, replace the number by the sum of the squares of its digits.
  * Repeat the process until the number equals 1 (where it will stay), or
    it loops endlessly in a cycle which does not include 1.
  * Those numbers for which this process ends in 1 are happy.

  Return true if n is a happy number, and false if not.

  Example 1:

  Input: n = 19
  Output: true
  Explanation:
  1^2 + 9^2 = 82
  8^2 + 2^2 = 68
  6^2 + 8^2 = 100
  1^2 + 0^2 + 0^2 = 1

  Example 2:

  Input: n = 2
  Output: false

=end

require 'pry'

def is_happy(n)
  visit = {}

  sum_of_square = ->(n) do
    output = 0

    while n > 0 do
      digit = n % 10          # Get the last digit
      digit = digit ** 2
      output += digit
      n = n / 10              # remove the last digit
    end
    output
  end

  while !visit.key?(n) do
    visit[n] = true
    n = sum_of_square.call(n)

    return true if n == 1
  end
  false
end

# n = 19
n = 2
p is_happy(n)
