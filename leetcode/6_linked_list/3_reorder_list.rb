=begin

https://leetcode.com/problems/reorder-list/description/

You are given the head of a singly linked-list. The list can be represented as:

L0 → L1 → … → Ln - 1 → Ln

Reorder the list to be on the following form:

L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …

You may not modify the values in the list's nodes. Only nodes themselves may be changed.

Example:
1 -> 2 -> 3 -> 4      [TO]
1 -> 4 -> 2 -> 3

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

# Input: head = [1,2,3,4]
# Output: [1,4,2,3]

# Input: head = [1,2,3,4,5]
# Output: [1,5,2,4,3]

# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  slow_pointer = head
  fast_pointer = head.next

  while fast_pointer and fast_pointer.next != nil do
    slow_pointer = slow_pointer.next
    fast_pointer = fast_pointer.next.next
  end

  second_pointer = slow_pointer.next

  slow_pointer.next = nil
  prev_pointer = nil
  while second_pointer != nil do
    next_pointer = second_pointer.next
    second_pointer.next = prev_pointer
    prev_pointer = second_pointer
    second_pointer = next_pointer
  end


  first_list, second_list = head, prev_pointer
  while second_list do
    tmp1, tmp2 = first_list.next, second_list.next
    first_list.next = second_list
    second_list.next = tmp1
    first_list, second_list = tmp1, tmp2
  end
  head.inline
end

l1 = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
l2 = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5, ListNode.new(8))))))


p reorder_list(l1)
# puts reorder_list(l2)

=begin

1 2 3 4 5

Split
1 2 3           4 5

Reverse Second
1 2 3           5 4

Merge
1 5 4           2 3
1 5 2 3         4
1 5 2 4 3       

=end

# sites
# https://takeuforward.org/data-structure/reorder-list/
# https://www.youtube.com/watch?v=rEYm4yLHSHQ