=begin

https://leetcode.com/problems/merge-two-sorted-lists/description/

You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. 
The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.


1 -> 2 -> 4  ||  1 -> 3 -> 4
1 -> 1 -> 2 -> 3 -> 4 -> 4
=end


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


p merge_two_lists(l1, l2)
