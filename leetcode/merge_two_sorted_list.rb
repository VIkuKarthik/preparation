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


# Definition for singly-linked list.
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  sorted_list = ListNode.new()
  dummy = sorted_list

  while list1 != nil and list2 != nil do
    sorted_list.next = ListNode.new()
    sorted_list = sorted_list.next

    if list1.val < list2.val
      sorted_list.val = list1.val
      list1 = list1.next
    else
      sorted_list.val = list2.val
      list2 = list2.next
    end
  end

  if list1 != nil
    sorted_list.next = list1
  end

  if list2 != nil
    sorted_list.next = list2
  end

  dummy.next.inline
end


l1 = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
l2 = ListNode.new(1, ListNode.new(3, ListNode.new(4, ListNode.new(4, ListNode.new(5)))))


puts merge_two_lists(l1, l2)
