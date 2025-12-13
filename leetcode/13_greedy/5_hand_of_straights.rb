=begin
  Alice has some number of cards and she wants to rearrange the
  cards into groups so that each group is of size groupSize,
  and consists of groupSize consecutive cards.

  Given an integer array hand where hand[i] is the value
  written on the ith card and an integer groupSize,
  return true if she can rearrange the cards, or false otherwise.

  Example 1:
  Input: hand = [1,2,3,6,2,3,4,7,8], groupSize = 3
  Output: true
  Explanation: Alice's hand can be rearranged as [1,2,3],[2,3,4],[6,7,8]

  Example 2:
  Input: hand = [1,2,3,4,5], groupSize = 4
  Output: false
  Explanation: Alice's hand can not be rearranged into groups of 4.
=end

require 'pry'

# @param {Integer[]} hand
# @param {Integer} group_size
# @return {Boolean}
def is_n_straight_hand(hand, group_size)
  return false if hand.size % group_size != 0

  hash = Hash.new(0)
  heap = []

  hand.each {|ele| hash[ele] += 1}
  hash.keys.each {|ele| heap << ele}
  heap.sort!
  result = []

  while !heap.empty? do
    first = heap[0]
    current = []

    (0...group_size).each do |group|
      if hash.key?(first+group)
        if hash[first+group] > 0
          current << first+group
          hash[first+group] -= 1
        end
        if hash[first+group] == 0
          return false if first+group != heap.data[0]
          heap.shift
        end
      end
    end
    # checking the min_heap and counter values are same
    return false if current.size < group_size

    result << current
  end
  true
end

hand = [2,1]
group_size = 2
p is_n_straight_hand(hand, group_size)
