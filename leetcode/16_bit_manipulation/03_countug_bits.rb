=begin

Given an integer n, return an array ans of
length n + 1 such that for each i (0 <= i <= n),
ans[i] is the number of 1's in the
binary representation of i.

Example 1:

Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10

Example 2:

Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101

=end


def count_bits(n)
  return [0] if n == 0

  res = [0] * (n)
  offset = 1

  (1..n).each do |counter|
    offset = counter if (offset * 2) == counter

    res[counter] = 1 + res[counter - offset]
  end
  res
end

n = 5
p count_bits(n)
