=begin
  Partition Labels

  You are given a string s. We want to partition the string into as
  many parts as possible so that each letter appears in at most one part.
  For example, the string "ababcc" can be partitioned into ["abab", "cc"],
  but partitions such as ["aba", "bcc"] or ["ab", "ab", "cc"] are invalid.

  Note that the partition is done so that after concatenating all
  the parts in order, the resultant string should be s.

  Return a list of integers representing the size of these parts.

  Example 1:

  Input: s = "ababcbacadefegdehijhklij"
  Output: [9,7,8]

  Explanation:
  The partition is "ababcbaca", "defegde", "hijhklij".
  This is a partition so that each letter appears in at most one part.
  A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.
=end


def partition_labels(string)
  hash = {}

  string.chars.each_with_index do |ele, index|
    hash[ele] = index
  end

  max_window = 0
  start = 0
  result = []

  (0...string.length).each do |counter|
    max_window = [hash[string[counter]], max_window].max

    if counter == max_window
      result << (max_window - start) + 1
      max_window = 0
      start = counter+1
    end

  end
  result
end

string = "ababcbacadefegdehijhklij"
p partition_labels(string)
