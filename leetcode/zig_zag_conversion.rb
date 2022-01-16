# P   A   H   N
# A P L S I I G
# Y   I   R
# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"


# P     I    N
# A   L S  I G
# Y A   H R
# P     I


# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(string, num_rows)
  lookup = Hash.new{|h, k| h[k] = []}
  
  down = true
  counter = 1

  string.chars.each do |char|
    lookup[counter].push(char)
    if (down && counter < num_rows) || (counter == 1)
      counter += 1
      down = true
    else
      counter -= 1
      down = false
    end
  end
  lookup.values.flatten.join('')
end

puts convert("PAYPALISHIRING", 3)
