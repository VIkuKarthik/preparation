# Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]



# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  lookup = Hash.new{|h, k| h[k] = []}

  strs.each do |str|
    sorted_str = str.chars.sort.join
    lookup[sorted_str] << str
  end
  lookup.values
end


# Alternate Ans
# def group_anagrams(strs)
#   strs.group_by {|str| str.chars.sort.join}.values
# end

p group_anagrams(["eat","tea","tan","ate","nat","bat"])