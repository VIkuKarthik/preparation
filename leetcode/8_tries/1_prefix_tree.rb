=begin

https://leetcode.com/problems/implement-trie-prefix-tree/description/

A trie (pronounced as "try") or prefix tree is a tree data structure 
used to efficiently store and retrieve keys in a dataset of strings. 
There are various applications of this data structure, such as autocomplete and spellchecker.

Implement the Trie class:

- Trie() Initializes the trie object.
- void insert(String word) Inserts the string word into the trie.
- boolean search(String word) Returns true if the string word is in the 
  trie (i.e., was inserted before), and false otherwise.
- boolean startsWith(String prefix) Returns true if there is a 
  previously inserted string word that has the prefix prefix, and false otherwise.

Example 1:

Input
["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
Output
[null, null, true, false, true, null, true]

Explanation
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // return True
trie.search("app");     // return False
trie.startsWith("app"); // return True
trie.insert("app");
trie.search("app");     // return True

=end

class TrieNode
  attr_accessor :children, :end_of_word

  def initialize
    @children = {}
    @end_of_word = false
  end
end


class Trie
  attr_reader :root

  def initialize()
    @root = TrieNode.new()
  end


=begin
  :type word: String
  :rtype: Void
=end
  def insert(word)
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
    current = root

    word.chars.each do |char|
      return false unless current.children.key?(char)

      current = current.children[char]
    end
    return current.end_of_word
  end


=begin
  :type prefix: String
  :rtype: Boolean
=end
  def starts_with(prefix)
    current = root

    prefix.chars.each do |char|
      return false unless current.children.key?(char)

      current = current.children[char]
    end
    true
  end


end

# Your Trie object will be instantiated and called as such:
obj = Trie.new()
obj.insert("apple")
obj.insert("ball")
obj.insert("bat")
obj.insert("alphabet")
p ["apple", "alphabet", "bat", "ball"]
puts "has word apple => #{obj.search("apple")}"
puts "starts with ba => #{obj.starts_with("ba")}"
puts "search for alphabets => #{obj.search("alphabets")}"
puts "starts with alp => #{obj.starts_with("alp")}"
