=begin

Letter Combinations of a Phone Number

Given a string containing digits from 2-9 inclusive,
return all possible letter combinations that the number could represent.
Return the answer in any order.

A mapping of digits to letters (just like on the telephone buttons) is given below.
Note that 1 does not map to any letters.

Example 1:

Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

=end


def letter_combinations(digits)
  result = []
  dictionary = {
    "2" => "abc",
    "3" => "def",
    "4" => "ghi",
    "5" => "jkl",
    "6" => "mno",
    "7" => "pqrs",
    "8" => "tuv",
    "9" => "wxyz"
  }


  dfs = ->(counter, current_string) do
    if digits.length == current_string.length
      result << current_string
      return
    end

    dictionary[digits[counter]].chars.each do |char|
      dfs.call(counter + 1, current_string + char)
    end
  end
  dfs.call(0, "") if digits.length > 0

  result
end

digits = "23"
p letter_combinations(digits)
