# The algorithm for myAtoi(string s) is as follows:

# Read in and ignore any leading whitespace.
# Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
# Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
# Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
# If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
# Return the integer as the final result.


# EXPLANATION
# Input: s = "4193 with words"
# Output: 4193
# Explanation:
# Step 1: "4193 with words" (no characters read because there is no leading whitespace)
#          ^
# Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
#          ^
# Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
#              ^
# The parsed integer is 4193.
# Since 4193 is in the range [-231, 231 - 1], the final result is 4193.


# @param {String} s
# @return {Integer}
def my_atoi(string)
  non_whitespace = string.strip
  number = /^([+-]?[0-9]+)/.match(non_whitespace)
  result = number.nil? ? 0 : number[0].to_i
  result > 0 ? [(2**31)-1, result].min : [(2**31)*-1, result].max
end



puts my_atoi("4193 with words")
puts my_atoi("42")
puts my_atoi("   -42")
puts my_atoi("words and 987")
puts my_atoi("-91283472332")
puts my_atoi("3.14159")
puts my_atoi("+-12")