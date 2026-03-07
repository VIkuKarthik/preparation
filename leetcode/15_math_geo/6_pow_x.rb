=begin
  Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

  Example 1:
  Input: x = 2.00000, n = 10
  Output: 1024.00000

  Example 2:
  Input: x = 2.10000, n = 3
  Output: 9.26100

  Example 3:
  Input: x = 2.00000, n = -2
  Output: 0.25000
  Explanation: 2-2 = 1/22 = 1/4 = 0.25
=end

def my_pow(x, n)
  helper = ->(x, n) do
    return 0 if x == 0
    return 1 if n == 0

    res = helper.call(x, n / 2)
    res *= res
    return x * res if n % 2 > 0 # handles ODD
    res
  end
  res = helper.call(x, n.abs)
  return res if n >= 0 # handles positive
  1 / res
end

x = 2.00000
n = 10
p my_pow(x, n)
