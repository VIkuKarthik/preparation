=begin

https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

Given a string s, find the length of the longest substring without repeating characters.

Example

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

########## HINT

* There will be two pointer at the initial state
* One of the pointer will move in the forward direction, while the other stay
* The character will be tracked in an Hash with Character as key and Index as a value
* If a repeating character has found!!
* The Pointer B will be incremented, with respect to the place of the 
  tracked character only if this is greater than Pointer B.

=end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(string)
  pointer_a = 0
  lookup = {}
  max = 0

  string.each_char.with_index do |char, pointer_b|
    if lookup[char]
			pointer_a = lookup[char]+1 if lookup[char] >= pointer_a
    end
    lookup[char] = pointer_b
    len = (pointer_b - pointer_a) + 1
    max = len if len > max
  end
  max
end

p length_of_longest_substring("pwwkew")
p length_of_longest_substring("bbbbb")
p length_of_longest_substring("abcabcbb")