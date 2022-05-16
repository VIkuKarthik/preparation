# Definition for singly-linked list.
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
  puts head.inline
end

l1 = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
l2 = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5, ListNode.new(8))))))


puts reorder_list(l1)
puts reorder_list(l2)
