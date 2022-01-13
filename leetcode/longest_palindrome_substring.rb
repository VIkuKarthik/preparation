# Input: s = "babad"
# Output: "bab"
# Explanation: "aba" is also a valid answer.

# Input: s = "cbbd"
# Output: "bb"

# @param {String} s
# @return {String}
def folding_algo(string)
	return string[0] if string.length <= 1
	return string if string == string.reverse
	modified_string = "##{string.chars.join("#")}#"
	palin = [0] * modified_string.length

	modified_string.chars.each_with_index do |char, index| 
		if index > 1
			while modified_string[index - (1 + palin[index]) ] == modified_string[index + (1 + palin[index]) ]
				palin[index] += 1
			end
		end
	end
	max_and_index = [palin.max, palin.index(palin.max)]

	right_side = modified_string[max_and_index[1]..((max_and_index[1]+max_and_index[0]))] 

	left_side = right_side[1..-1].reverse
	
	combine_result = left_side+right_side

	combine_result.gsub!("#", "")
	
	combine_result
end

puts folding_algo("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
puts folding_algo("cbbd")
puts folding_algo("ababc")
puts folding_algo("aaaabbaa")
puts folding_algo("geeksskeeg")