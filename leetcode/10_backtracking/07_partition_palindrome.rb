=begin

Palindrome Partitioning

Given a string s, partition s such that every
substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

Example 1:

Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]


=end

def partition(string)
  result = []
  partition = []

  dfs = ->(counter) do
    if counter >= string.length
      result << partition.dup
      return
    end

    (counter..string.length).each do |index|
      if is_palindrome(string, counter, index)
        partition << string[counter..index]
        dfs.call(index+1)
        partition.pop
      end
    end
  end

  dfs.call(0)
  result
end

def is_palindrome(string, pointer_a, pointer_b)
  while pointer_a < pointer_b do
    return false if string[pointer_a] != string[pointer_b]
    pointer_a += 1
    pointer_b -= 1
  end
  true
end

string = "aab"
p partition(string)
