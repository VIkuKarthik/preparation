=begin

https://leetcode.com/problems/word-search-ii/description/

Given an m x n board of characters and a list of strings words, return all words on the board.

Each word must be constructed from letters of sequentially
adjacent cells, where adjacent cells are horizontally or vertically neighboring.
The same letter cell may not be used more than once in a word.


Example:
  Input:
  board = [
            ["o","a","a","n"],
            ["e","t","a","e"],
            ["i","h","k","r"],
            ["i","f","l","v"]
          ],
  words = ["oath","pea","eat","rain"]
  Output: ["eat","oath"]


  Input: board = [["a","b"],["c","d"]], words = ["abcb"]
  Output: []
=end

require 'set'

class TrieNode
  attr_accessor :children, :end_of_word, :ref

  def initialize
    @children = {}
    @end_of_word = false
    @ref = 0
  end

  def add_word(word)
    current = self
    current.ref += 1

    word.chars.each do |char|
      current.children[char] = TrieNode.new() unless current.children.key?(char)
      current = current.children[char]
      current.ref += 1
    end
    current.end_of_word = true
  end

  def remove_word(word)
    current = self
    current.ref -= 1

    word.chars.each do |char|
      if current.end_of_word
        current.end_of_word = false
        return
      end
      current = current.children[char]
      current.ref -= 1
    end
  end

end


def find_words(board, words)
  node = TrieNode.new()

  words.each do |word|
    node.add_word(word)
  end
  result, visited = Set.new, Set.new
  rows, cols = board.length, board[0].length

  rows.times do |row|
    cols.times do |col|
      # p "traverse => #{[row, col]} => #{board[row][col]} => #{node.children.keys.include?(board[row][col])}, visited #{visited}, ref: #{node.children[board[row][col]].ref}"
      dfs = -> (row, col, node, word) do
        if (
          row < 0 ||
          col < 0 ||
          row >= rows ||
          col >= cols ||
          !node.children.keys.include?(board[row][col]) ||
          visited.include?([row, col]) ||
          node.children[board[row][col]].ref < 1
          )
          return
        end

        visited.add [row, col]
        # p "visited => #{visited}, char => #{board[row][col]}"
        word += board[row][col]
        node = node.children[board[row][col]]

        if node.end_of_word
          p "WORD => #{word}"
          node.remove_word word
          result.add word
          visited.delete [row, col]
        end

        dfs.call(row - 1, col, node, word)
        dfs.call(row + 1, col, node, word)
        dfs.call(row, col - 1, node, word)
        dfs.call(row, col + 1, node, word)
        visited.delete [row, col]
      end

      dfs.call(row, col, node, "")
    end
  end

  result.to_a
end

board = [
            ["o","a","a","n"],
            ["e","t","a","e"],
            ["i","h","k","r"],
            ["i","f","l","v"]
          ]

words = ["fhta", "oath","pea","eat","rain", "athf"]



# board = [
#           ["o","a","b","n"],
#           ["o","t","a","e"],
#           ["a","h","k","r"],
#           ["a","f","l","v"]
#         ]

# words = ["oa","oaa"]  # ["oa","oaa"]

# board = [ ["a","a"] ]
# words = ["aaa"] # []


# board = [
#           ["o","a","a","n"],
#           ["e","t","a","e"],
#           ["i","h","k","r"],
#           ["i","f","l","v"]
#         ]
# words = ["oath","pea","eat","rain","hklf", "hf"]   # ["oath","eat","hklf","hf"]


# board = [
#           ["o","a","a","n"],
#           ["e","t","a","e"],
#           ["i","h","k","r"],
#           ["i","f","l","v"]
#         ]

# words = ["oath","pea","eat","rain","oathi","oathk","oathf","oate","oathii","oathfi","oathfii"]
# ["oath","oathk","oathf","oathfi","oathfii","oathi","oathii","oate","eat"]



# board = [
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"],
#           ["a","a","a","a","a","a","a","a","a","a","a","a"]
#         ]
# words = [
#           "lllllll","fffffff","ssss","s","rr","xxxx","ttt",
#           "eee","ppppppp","iiiiiiiii","xxxxxxxxxx","pppppp",
#           "xxxxxx","yy","jj","ccc","zzz","ffffffff","r",
#           "mmmmmmmmm","tttttttt","mm","ttttt","qqqqqqqqqq","z",
#           "aaaaaaaa","nnnnnnnnn","v","g","ddddddd","eeeeeeeee",
#           "aaaaaaa","ee","n","kkkkkkkkk","ff","qq","vvvvv","kkkk","e",
#           "nnn","ooo","kkkkk","o","ooooooo","jjj","lll","ssssssss","mmmm",
#           "qqqqq","gggggg","rrrrrrrrrr","iiii","bbbbbbbbb","aaaaaa","hhhh",
#           "qqq","zzzzzzzzz","xxxxxxxxx","ww","iiiiiii","pp","vvvvvvvvvv",
#           "eeeee","nnnnnnn","nnnnnn","nn","nnnnnnnn","wwwwwwww","vvvvvvvv",
#           "fffffffff","aaa","p","ddd","ppppppppp","fffff","aaaaaaaaa",
#           "oooooooo","jjjj","xxx","zz","hhhhh","uuuuu","f",
#           "ddddddddd","zzzzzz","cccccc","kkkkkk","bbbbbbbb","hhhhhhhhhh",
#           "uuuuuuu","cccccccccc","jjjjj","gg","ppp","ccccccccc","rrrrrr","c",
#           "cccccccc","yyyyy","uuuu","jjjjjjjj","bb","hhh","l","u","yyyyyy","vvv",
#           "mmm","ffffff","eeeeeee","qqqqqqq","zzzzzzzzzz","ggg","zzzzzzz",
#           "dddddddddd","jjjjjjj","bbbbb","ttttttt","dddddddd","wwwwwww","vvvvvv",
#           "iii","ttttttttt","ggggggg","xx","oooooo","cc","rrrr","qqqq","sssssss",
#           "oooo","lllllllll","ii","tttttttttt","uuuuuu","kkkkkkkk","wwwwwwwwww",
#           "pppppppppp","uuuuuuuu","yyyyyyy","cccc","ggggg","ddddd","llllllllll",
#           "tttt","pppppppp","rrrrrrr","nnnn","x","yyy","iiiiiiiiii","iiiiii","llll",
#           "nnnnnnnnnn","aaaaaaaaaa","eeeeeeeeee","m","uuu","rrrrrrrr","h","b",
#           "vvvvvvv","ll","vv","mmmmmmm","zzzzz","uu","ccccccc","xxxxxxx",
#           "ss","eeeeeeee","llllllll","eeee","y","ppppp","qqqqqq","mmmmmm","gggg",
#           "yyyyyyyyy","jjjjjj","rrrrr","a","bbbb","ssssss","sss","ooooo","ffffffffff",
#           "kkk","xxxxxxxx","wwwwwwwww","w","iiiiiiii","ffff","dddddd","bbbbbb","uuuuuuuuu",
#           "kkkkkkk","gggggggggg","qqqqqqqq","vvvvvvvvv","bbbbbbbbbb","nnnnn","tt",
#           "wwww","iiiii","hhhhhhh","zzzzzzzz","ssssssssss","j","fff","bbbbbbb","aaaa",
#           "mmmmmmmmmm","jjjjjjjjjj","sssss","yyyyyyyy","hh","q","rrrrrrrrr","mmmmmmmm","wwwww",
#           "www","rrr","lllll","uuuuuuuuuu","oo","jjjjjjjjj","dddd","pppp","hhhhhhhhh","kk",
#           "gggggggg","xxxxx","vvvv","d","qqqqqqqqq","dd","ggggggggg","t","yyyy","bbb",
#           "yyyyyyyyyy","tttttt","ccccc","aa","eeeeee","llllll","kkkkkkkkkk","sssssssss",
#           "i","hhhhhh","oooooooooo","wwwwww","ooooooooo","zzzz","k","hhhhhhhh","aaaaa","mmmmm"
#         ]

# ["a", "aa", "aaa", "aaaa", "aaaaa", "aaaaaa", "aaaaaaa", "aaaaaaaa", "aaaaaaaaa", "aaaaaaaaaa"]
p find_words(board, words)
