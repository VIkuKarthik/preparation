# Evaluate the value of an arithmetic expression in Reverse Polish Notation.

# Valid operators are +, -, *, and /. Each operand may be an integer or another expression.

# Note that division between two integers should truncate toward zero.

# It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.


# Example 1:

# Input: tokens = ["2","1","+","3","*"]
# Output: 9
# Explanation: ((2 + 1) * 3) = 9
# Example 2:

# Input: tokens = ["4","13","5","/","+"]
# Output: 6
# Explanation: (4 + (13 / 5)) = 6
# Example 3:

# Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
# Output: 22
# Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
# = ((10 * (6 / (12 * -11))) + 17) + 5
# = ((10 * (6 / -132)) + 17) + 5
# = ((10 * 0) + 17) + 5
# = (0 + 17) + 5
# = 17 + 5
# = 22

# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  operators = ['+', '-', '/', '*'] # instea, if else statement can be used
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
