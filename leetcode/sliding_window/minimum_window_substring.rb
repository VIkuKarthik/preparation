# Given two strings s and t of lengths m and n respectively, 
# return the minimum window substring of s such that every character in t (including duplicates) is included in the window. 
# If there is no such substring, return the empty string "".

# The testcases will be generated such that the answer is unique.

# A substring is a contiguous sequence of characters within the string.

# Example 1:

# Input: s = "ADOBECODEBANC", t = "ABC"
# Output: "BANC"
# Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

# Example 2:

# Input: s = "a", t = "a"
# Output: "a"
# Explanation: The entire string s is the minimum window.

# Example 3:

# Input: s = "a", t = "aa"
# Output: ""
# Explanation: Both 'a's from t must be included in the window.
# Since the largest window of s only has one 'a', return empty string.


# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  contains = Hash.new(0)
  max_length = s.length + 1
  left = 0
  right = 0
  count = 0
  result = ""
  
  t.chars.each do |char| 
    contains[char] += 1
  end


  while right < s.length do
    
    if count != t.length
      if contains[s[right]]
        count += 1 if contains[s[right]] > 0
        contains[s[right]] -= 1
      end
      right += 1
    end

    while count == t.length do
      if contains[s[left]]
        count -= 1 if contains[s[left]] >= 0
        contains[s[left]] += 1
        diff = right - left
        if diff < max_length
          max_length = diff
          result = s[left...right]
        end
      end
      left += 1
    end
  end
  result
end

p min_window('ADOBECODEBANC', 'ABC')
p min_window('a', 'a')
p min_window('ab', 'a')
p min_window('cabwefgewcwaefgcf', 'cae')
