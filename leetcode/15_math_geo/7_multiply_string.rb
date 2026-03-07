=begin
  Given two non-negative integers num1 and num2 represented as strings,
  return the product of num1 and num2, also represented as a string.

  Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

  Example 1:
  Input: num1 = "2", num2 = "3"
  Output: "6"

  Example 2:
  Input: num1 = "123", num2 = "456"
  Output: "56088"
=end

def multiply(num1, num2)
  m = num1.length
  n = num2.length

  result = Array.new(m + n, 0)

  (m - 1).downto(0) do |i|
    (n - 1).downto(0) do |j|
      # mul = num1[i].to_i * num2[j].to_i
      mul = (num1[i].ord - 48) * (num2[j].ord - 48)
      sum = mul + result[i + j + 1]

      result[i + j + 1] = sum % 10
      result[i + j] += sum / 10
    end
  end
  result.join.sub(/^0+/, "")
end

num1 = "123"
num2 = "32"
p multiply(num1, num2)
