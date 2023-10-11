=begin

https://leetcode.com/problems/group-anagrams/

Given an array of strings strs, group the anagrams together. 
You can return the answer in any order.

An Anagram is a word or phrase formed by 
rearranging the letters of a different word or 
phrase, typically using all the original letters exactly once.

Example:

Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Input: strs = [""]
Output: [[""]]

Input: strs = ["a"]
Output: [["a"]]

=end


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

# =============================================
# Alternate
def group_anagrams(strs)
  strs.group_by {|str| str.chars.sort.join}.values
end

p group_anagrams(["eat","tea","tan","ate","nat","bat"])