=begin
  Valid Parenthesis String

  Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.

  The following rules define a valid string:

  Any left parenthesis '(' must have a corresponding right parenthesis ')'.
  Any right parenthesis ')' must have a corresponding left parenthesis '('.
  Left parenthesis '(' must go before the corresponding right parenthesis ')'.
  '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".

  Example 1:

  Input: s = "()"
  Output: true

  Example 2:

  Input: s = "(*)"
  Output: true
=end

require 'pry'

def check_valid_string(string)
  max = 0
  min = 0

  string.chars.each do |char|
    if char == "("
      max += 1
      min += 1
    elsif char == ")"
      max -= 1
      min -= 1
    else
      max += 1
      min -= 1
    end
    return false if max < 0

    min = 0 if min < 0
  end
  min == 0
end


# USING STACK PASSED IN LEETCODE
def check_valid_string(string)
  chars = []
  wildcards = []

  string.chars.each_with_index do |ele, index|
    if ele == "("
      chars << index
    elsif ele == ")"
      if !chars.empty?
        chars.pop
      elsif !wildcards.empty?
        wildcards.pop
      else
        return false
      end
    else
      wildcards << index
    end
  end

  return false if chars.length > 0 && wildcards.length <= 0
  return false if chars.length > wildcards.length
  return true if chars.length == 0

  chars_count = chars.length

  (0...chars.length).each do |counter|
    return true if chars_count == 0
    if chars[(chars.length-1)-counter] < wildcards[-1]
      wildcards.pop
      chars_count -= 1
    end
  end
  chars_count <= 0
end

string = "(*))" # true
# string = "*(()" # false
# string = "(((((()*)(*)*))())())(()())())))((**)))))(()())()" # false
# string = "(*)" # true
# string = "((((()(()()()*()(((((*)()*(**(())))))(())()())(((())())())))))))(((((())*)))()))(()((*()*(*)))(*)()" # true
# string = "(((((*(()((((*((**(((()()*)()()()*((((**)())*)*)))))))(())(()))())((*()()(((()((()*(())*(()**)()(())" # false
# string = "(((((*)))**" # true
# string = "()(((((()((((**)))((*()()(())(((*)((()(()))(()())(" # false
# string = "()(())(((((()())(()))))()(*()))()()()()((()(())())*((((())))*())()(()()))*((()(()(()))))(()())(*(*" # true

p check_valid_string(string)
