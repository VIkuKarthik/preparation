# Input: head = [1,2,3,4,5]
# Output: [5,4,3,2,1]


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


# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  prev_pointer = nil
  current_pointer = head

  while current_pointer != nil do
    nxt_pointer = current_pointer.next
    current_pointer.next = prev_pointer
    prev_pointer = current_pointer
    current_pointer = nxt_pointer
  end
  prev_pointer
end

ln = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
puts reverse_list(ln)