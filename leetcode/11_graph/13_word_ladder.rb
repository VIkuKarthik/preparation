=begin

Word Ladder

A transformation sequence from word beginWord to word endWord using
a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:


-> Every adjacent pair of words differs by a single letter.
-> Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
-> sk == endWord


Given two words, beginWord and endWord, and a dictionary wordList,
return the number of words in the shortest transformation sequence from
beginWord to endWord, or 0 if no such sequence exists.


Example 1:

Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
Output: 5
Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.

Example 2:

Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
Output: 0
Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.

=end


def ladder_length(begin_word, end_word, word_list)
  return 0 if !word_list.include?(end_word)

  neighbour = Hash.new {|h, k| h[k] = []}
  word_list.append(begin_word)

  word_list.each do |word|
    word.length.times do |counter|
      pattern = word[0...counter] + '*' + word[(counter + 1)..-1]
      neighbour[pattern].append(word)
    end
  end

  visit = Set.new()
  visit.add(begin_word)
  queue = [begin_word]
  result = 1

  while !queue.empty? do
    queue.length.times do |q_counter|
      word = queue.shift
      return result if word == end_word

      word.length.times do |word_length|
        pattern = word[0...word_length] + '*' + word[(word_length + 1)..-1]

        neighbour[pattern].each do |neigh|
          if !visit.include?(neigh)
            visit.add(neigh)
            queue.append(neigh)
          end
        end
      end
    end
    result += 1
  end
  0
end

# begin_word = "hit"
# end_word = "cog"
# word_list = ["hot","dot","dog","lot","log","cog"]

begin_word = "hot"
end_word = "dog"
word_list = ["hot","dog"]

p ladder_length(begin_word, end_word, word_list)
