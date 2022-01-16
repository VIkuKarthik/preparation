# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  input = x
  result = 0
  while (x / 10) > 0 do
    remainder = x % 10
    result = (result*10) + remainder
    x = x / 10
  end
  result = (result*10) + (x % 10)
  result == input
end

puts is_palindrome(121)
puts is_palindrome(-121)
puts is_palindrome(10)