=begin

https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/

Given the head of a linked list, remove the nth node from the end of the list and return its head.

1 ->  2 ->  3 ->  4 ->  5

1 ->  2 ->  3 ->  5

Example:
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]

=end

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
    @inline = []
  end

  def inline
    @inline = []
		get_next(self)
		@inline
	end

  def get_head

  end

	private

	def get_next(list)
		@inline << list.val
		get_next(list.next) if list.next
	end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  dummy = ListNode.new(0, head)
  left = dummy

  right = dummy.next
  n.times do
    right = right.next
  end

  while right do
    right = right.next
    left = left.next
  end

  left.next = left.next.next
  dummy.next.inline
end

l1 = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))

p remove_nth_from_end(l1, 1)