=begin

https://leetcode.com/problems/linked-list-cycle/description/

Given head, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can 
be reached again by continuously following the next pointer. 
Internally, pos is used to denote the index of the node that tail's next pointer is connected to. 
Note that pos is not passed as a parameter.

Return true if there is a cycle in the linked list. Otherwise, return false.

Input: head = [3,2,0,-4], pos = 1
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).

=end

=begin
1 ->  2 ->  3 ->  4 ->
      |              |
      ---------------- 
=end      

class ListNode
	attr_accessor :val, :next

	def initialize(val = 0, _next = nil)
		@val = val
		@next = _next
		@inline = []
	end

	def inline
		get_next(self)
		@inline.inspect
	end

	private

	def get_next(list)
		@inline << list.val
		get_next(list.next) if list.next
	end
end


# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  slow, fast = head, head

  while fast && fast.next do
    slow = head.next
    fast = head.next.next
    if slow == fast
      return true
    end
  end
  return false
end