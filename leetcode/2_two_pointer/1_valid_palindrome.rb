=begin

https://leetcode.com/problems/valid-palindrome/

A phrase is a palindrome if, after converting all uppercase letters into lowercase letters 
and removing all non-alphanumeric characters, it reads the same forward and backward. 
Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

Example 1:

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.

=end

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  b = s.length-1
  s.chars.each_with_index do |char, index|
    next unless is_alphanumeric(char)
    while !is_alphanumeric(s[b]) do
      b-= 1
    end

    break if b < index
    return false if s[index].downcase != s[b].downcase
    b -= 1
  end
  true
end

def is_alphanumeric(char)
  (65..90).member?(char.ord) || (97..122).member?(char.ord) || (48..57).member?(char.ord)
end

p is_palindrome('A man, a plan, a canal: Panama')
p is_palindrome("race a car")
p is_palindrome("")