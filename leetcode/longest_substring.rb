# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.


# There will be two pointer at the initial state
# One of the pointer will move in the forward direction, while the other stay
# The character will the tracked in an Hash with Character as key and Index as a value
# If a repeating character has found, 
# The Pointer B will be incremented, with respect to the place of the tracked character only if this is greater than Pointer B.


# @param {String} s
# @return {Integer}
def length_of_longest_substring(string)
  pointer_b = 0
  lookup = {}
  max = 0

  string.each_char.with_index do |char, pointer_a|
    if lookup[char]
			pointer_b = lookup[char]+1 if lookup[char] >= pointer_b
    end
    lookup[char] = pointer_a
    len = (pointer_a - pointer_b) + 1
    max = len if len > max
  end
  max
end

puts length_of_longest_substring("pwwkew")
puts length_of_longest_substring("bbbbb")
puts length_of_longest_substring("abcabcbb")