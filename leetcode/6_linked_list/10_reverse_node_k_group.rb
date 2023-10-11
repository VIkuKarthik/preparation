=begin

https://leetcode.com/problems/reverse-nodes-in-k-group/description/

Given the head of a linked list, 
reverse the nodes of the list k at a time, 
and return the modified list.

k is a positive integer and is less than or equal to the length of the linked list. 
If the number of nodes is not a multiple of k then left-out nodes, 
in the end, should remain as it is.

You may not alter the values in the list's nodes, only nodes themselves may be changed.

Example
Input: head = [1,2,3,4,5], k = 2
Output: [2,1,4,3,5]

Example
Input: head = [1,2,3,4,5], k = 3
Output: [3,2,1,4,5]

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
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  dummy = ListNode.new(0, head)
  group_prev = dummy

  while true do
		kth = getKth(group_prev, k)
		break if kth.nil?

		group_nxt = kth.next

		# reverse current group
		prev, current = kth.next, group_prev.next
		while current != group_nxt do
			tmp = current.next
			current.next = prev
			prev = current
			current = tmp
		end

		tmp = group_prev.next
		group_prev.next = kth
		group_prev = tmp
  end
	dummy.next
end

def getKth(curr, k)
	while curr && k > 0 do
		curr = curr.next
		k -= 1
	end
	curr
end

ln = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
p reverse_k_group(ln, 2).inline