# You are given a string s and an integer k. 
# You can choose any character of the string and change it to any other uppercase English character. 
# You can perform this operation at most k times.

# Return the length of the longest substring containing the same letter you can get after performing the above operations.


# Example 1:

# Input: s = "ABAB", k = 2
# Output: 4
# Explanation: Replace the two 'A's with two 'B's or vice versa.

# Example 2:

# Input: s = "AABABBA", k = 1
# Output: 4
# Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
# The substring "BBBB" has the longest repeating letters, which is 4.

# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
  pointer_a = 0
  result = 0
  lookup = Hash.new(0)

  s.chars.each_with_index do |char, pointer_b|
    lookup[char] += 1

    while (((pointer_b - pointer_a) + 1) - lookup.values.max) > k do
      lookup[s[pointer_a]] -= 1
      pointer_a += 1
    end
    
    result = [result, ((pointer_b - pointer_a) + 1)].max
  end
  result
end

p character_replacement("ABAB", 2)
p character_replacement("AABABBA", 1)