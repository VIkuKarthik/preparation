=begin

https://leetcode.com/problems/valid-parentheses/description/

Given a string s containing just the characters 
'(', ')', '{', '}', '[' and ']', 
determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.

Example 1:

Input: s = "()"
Output: true
Example 2:

Input: s = "()[]{}"
Output: true
Example 3:

Input: s = "(]"
Output: false

=end

# @param {String} s
# @return {Boolean}
def is_valid(s)
  hash = {
    ')' => '(',
    '}' => '{',
    ']' => '[',
    '>' => '<'
  }
  stack = []
  s.chars.each do |char|
    if stack.empty?
      stack << char
    else
      if hash[char] == stack[-1]
        stack.pop
      else
        stack << char
      end
    end
  end
  stack.empty?
end

p is_valid('[]')

