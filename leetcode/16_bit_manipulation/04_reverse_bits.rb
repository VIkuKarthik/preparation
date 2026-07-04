=begin
  Reverse bits of a given 32 bits signed integer.

Example 1:

Input: n = 43261596

Output: 964176192

Explanation:

Integer	              Binary
43261596	00000010100101000001111010011100
964176192	00111001011110000010100101000000

Example 2:

Input: n = 2147483644

Output: 1073741822

Explanation:

Integer	                Binary
2147483644	01111111111111111111111111111100
1073741822	00111111111111111111111111111110


=end

def reverse_bits(n)
  reversed = 0

  32.times do |counter|
    reversed = reversed << 1

    last_bit = n & 1
    n = n >> 1
    reversed = reversed | last_bit
  end
  reversed
end

n = 43261596
p reverse_bits(n)
