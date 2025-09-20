=begin
Alien Dictionary

There is a foreign language which uses the latin alphabet,
but the order among letters is not "a", "b", "c" ... "z" as in English.

You receive a list of non-empty strings words from the dictionary,
where the words are sorted lexicographically based on the rules of this new language.

Derive the order of letters in this language. If the order is invalid,
return an empty string. If there are multiple valid order of letters, return any of them.

A string a is lexicographically smaller than a string b if either of the following is true:

  The first letter where they differ is smaller in a than in b.
  a is a prefix of b and a.length < b.length.

Example 1:
  Input: ["hrn","hrf","er","enn","rfnn"]
  Output: "hernf"
=end


def alien_dict(arr)
  hash = Hash.new {|h, k| h[k] = []}
  indegree = Hash.new(0)

  arr.each do |word|
    word.chars.each { |ch| indegree[ch] = 0 }
  end

  compare = ->(word_1, word_2) do
    len = [word_1.length, word_2.length].min

    (0..len).each do |counter|
      if word_1[counter] != word_2[counter]
        hash[word_1[counter]] << word_2[counter]
        indegree[word_2[counter]] += 1
        return
      end
    end

    return "" if word_1.length > word_2.length
  end

  (1..arr.length-1).to_a.each do |counter|
    compare.call(arr[counter-1], arr[counter])
  end

  queue = []
  indegree.each { |ch, deg| queue << ch if deg == 0 }
  result = ""

  while !queue.empty? do
    char = queue.shift
    result << char

    hash[char].each do |val|
      indegree[val] -= 1
      queue.push(val) if indegree[val] == 0
    end
  end

  result
end

words = ["hrn","hrf","er","enn","rfnn"]
# words = ["wrt","wrf","er","ett","rftt"] # => "wertf"
p alien_dict(words)
