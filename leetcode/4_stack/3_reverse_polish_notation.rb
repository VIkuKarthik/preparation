=begin

https://leetcode.com/problems/evaluate-reverse-polish-notation/description/

You are given an array of strings tokens that represents an 
arithmetic expression in a Reverse Polish Notation.

Evaluate the expression. Return an integer that represents the value of the expression.

Note that:
The valid operators are '+', '-', '*', and '/'.
Each operand may be an integer or another expression.
The division between two integers always truncates toward zero.
There will not be any division by zero.
The input represents a valid arithmetic expression in a reverse polish notation.
The answer and all the intermediate calculations can be represented in a 32-bit integer.

Example 1:

Input: tokens = ["2","1","+","3","*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9


Input: tokens = ["4","13","5","/","+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6

Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
Output: 22
Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22

=end


# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  operators = ['+', '-', '/', '*'] # instead, if else statement can be used
  stack = []
  tokens.each do |token|
    if operators.include?(token)
      first = stack.pop
      second = stack.pop
      if token=="/"
        div = (second.to_f).public_send(token, first.to_f)
        stack << (div.negative? ? div.ceil.to_i : div.floor.to_i)
      else
        stack << (second.to_f).public_send(token, first.to_f).to_i
      end
    else
      stack << token
    end
  end
  stack.pop
end

puts eval_rpn(["4","13","5","/","+"])
puts eval_rpn(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
puts eval_rpn(["4","13","5","/","+"])

# ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
# ["10","6","12","-11","*","/","*","17","+","5","+"]
# ["10","6","12","-11","*","/","*","17","+","5","+"]
# ["10","6","-132","/","*","17","+","5","+"]
# ["10","0","*","17","+","5","+"]
# ["0","17","+","5","+"]
# ["17","5","+"]
# ["22"]
