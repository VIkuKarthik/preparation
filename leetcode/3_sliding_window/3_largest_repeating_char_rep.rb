=begin

https://leetcode.com/problems/longest-repeating-character-replacement/description/

You are given a string s and an integer k. 
You can choose any character of the string and change it to any other 
uppercase English character. You can perform this operation at most k times.

Return the length of the longest substring containing the same letter you can 
get after performing the above operations.

Example:

Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.

Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
There may exists other ways to achive this answer too.

########## HINT

* There will be two pointers A and B at the initial state
* While pointerB moves, it will track the character in hash table
* for each iteration, check whether we have utilized the replacement character, but how?
    Take the count between two pointers and add with the max value in the hash
    check whether this number is greater than K
* If the value is greater than K, then move the PointerA to next char 
  and decrement the max value from hash  [repeat this step]

=end

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

=begin
  window_length - count[max_in_hash]
=end