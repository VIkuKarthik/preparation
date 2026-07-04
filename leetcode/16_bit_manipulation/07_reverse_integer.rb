=begin
  Given a signed 32-bit integer x, return x with its
  digits reversed. If reversing x causes the value to
  go outside the signed 32-bit integer
  range [-231, 231 - 1], then return 0.

  Assume the environment does not allow you to
  store 64-bit integers (signed or unsigned).

  Example 1:

  Input: x = 123
  Output: 321

  Example 2:

  Input: x = -123
  Output: -321
=end

INT_MAX = 2147483647
INT_MIN = -2147483648
def reverse(x)
  res = 0
  sign = -1
  is_sign = false

  if x < 0
    x *= sign
    is_sign = true
  end

  while x != 0 do
    digit = x % 10
    x = x / 10

    if (res > (INT_MAX / 10) ) || (res == INT_MAX / 10) && (digit > INT_MAX % 10)
      return 0
    end

    if (res < (INT_MIN / 10) ) || (res == INT_MIN / 10) && (digit < INT_MIN % 10)
      return 0
    end

    res = (res * 10) + digit
  end
  is_sign ? res * -1 : res
end

x = 123
p reverse(x)
