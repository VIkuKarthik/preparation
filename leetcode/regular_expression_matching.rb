# Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:


# Input: s = "aa", p = "a"
# Output: false
# Explanation: "a" does not match the entire string "aa".

# Input: s = "aa", p = "a*"
# Output: true
# Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".

# Input: s = "ab", p = ".*"
# Output: true
# Explanation: ".*" means "zero or more (*) of any character (.)".



# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(string, pattern, i=0, j=0)
  return i == string.length if j == pattern.length

  match = i < string.length && [string[i], "."].include?(pattern[j])

  if pattern[j+1] == "*"
    is_match(string, pattern, i, j+2) || ( match && is_match(string, pattern, i+1, j) )
  else
    match && is_match(string, pattern, i+1, j+1)
  end
  
end


puts is_match("aa", ".*")



