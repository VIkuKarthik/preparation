=begin
  Number of 1 Bits

  Given a positive integer n, write a function that
  returns the number of set bits in its binary representation
  (also known as the Hamming weight).

  Example:
  Input: n = 11
  Output: 3

  Explanation:
  The input binary string 1011 has a total of three set bits.

  Input: n = 128
  Output: 1
  Explanation:
  The input binary string 10000000 has a total of one set bit.
=end


def hamming_weight(n)
  res = 0

  while n > 0 do
    n = n & (n - 1)
    res += 1
  end
  res
end


n = 128
p hamming_weight(n)
