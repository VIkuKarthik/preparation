# Input: strs = ["eat","tea","tan","ate","nat","bat"]
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]



# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  lookup = Hash.new{|h, k| h[k] = []}

  strs.each do |str|
    sorted_str = str.chars.sort.join
    if lookup[sorted_str]
      lookup[sorted_str] << str
    else
      lookup[sorted_str] << str
    end
  end
  lookup.values.inspect
end

puts group_anagrams(["eat","tea","tan","ate","nat","bat"])