=begin
  Given two integers a and b, return the sum of
  the two integers without using
  the operators + and -.

  Example 1:

  Input: a = 1, b = 2
  Output: 3

  Example 2:

  Input: a = 2, b = 3
  Output: 5
=end

def get_sum(a, b)
  mask = 0xFFFFFFFF
  max_int = 0x7FFFFFFF

  while b != 0 do
    carry = (a & b) << 1
    a = (a ^ b) & mask
    b = carry & mask
  end
  a <= max_int ? a : ~(a ^ mask)
end

a = -1
b = 1
p get_sum(a, b)
