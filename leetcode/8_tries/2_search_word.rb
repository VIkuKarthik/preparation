=begin

https://leetcode.com/problems/design-add-and-search-words-data-structure/description/

Design a data structure that supports adding new words and 
finding if a string matches any previously added string.

Implement the WordDictionary class:

- WordDictionary() Initializes the object.
- void addWord(word) Adds word to the data structure, it can be matched later.
- bool search(word) Returns true if there is any string in the 
  data structure that matches word or false otherwise. 
  word may contain dots '.' where dots can be matched with any letter.


Example
  Input
    ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
    [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
  Output
    [null,null,null,null,false,true,true,true]

  Explanation
    WordDictionary wordDictionary = new WordDictionary();
    wordDictionary.addWord("bad");
    wordDictionary.addWord("dad");
    wordDictionary.addWord("mad");
    wordDictionary.search("pad"); // return False
    wordDictionary.search("bad"); // return True
    wordDictionary.search(".ad"); // return True
    wordDictionary.search("b.."); // return True    

=end

class TrieNode
  attr_accessor :children, :end_of_word

  def initialize()
    @children = {}
    @end_of_word = false
  end
end


class WordDictionary
  attr_accessor :root

  def initialize()
    @root = TrieNode.new()    
  end


=begin
  :type word: String
  :rtype: Void
=end
  def add_word(word)
    current = root

    word.chars.each do |char|
      current.children[char] = TrieNode.new() unless current.children.key?(char)
      current = current.children[char]
    end
    current.end_of_word = true
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word)
    dfs = -> (j, node) do
      current = node
      (j...(word.length)).to_a.each do |counter|
        char = word[counter]

        if char == "."
          current.children.values.each do |child|
            return true if dfs.call(counter+1, child)
          end
          return false
        else
          return false unless current.children.key?(char)

          current = current.children[char]
        end
      end
      current.end_of_word
    end
    dfs.call(0, root)
  end

end

# Your WordDictionary object will be instantiated and called as such:
obj = WordDictionary.new()
obj.add_word("ans")
obj.add_word("ant")
obj.add_word("and")
puts "Search for a.s => #{obj.search('a.s')}"

# obj.add_word("bad")
# obj.add_word("dad")
# obj.add_word("mad")
# obj.add_word("pad")
# puts "Search for .ad => #{obj.search('.ad')}"
# puts "Search for b.. => #{obj.search('b..')}"
# puts "Search for b.. => #{obj.search('b...')}"
# puts "Search for b.. => #{obj.search('z..')}"
# puts "Search for b.. => #{obj.search('..z')}"