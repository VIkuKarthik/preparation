# Input: x = 123
# Output: 321


# @param {Integer} x
# @return {Integer}
def reverse(x)
  result = 0
  while (x / 10) > 0 do
    remainder = x % 10
    result = (result*10) + remainder
    x = x / 10
  end
  result = (result*10) + (x % 10)
  result
end

puts reverse(4321)
puts reverse(99887)