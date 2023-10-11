=begin

https://leetcode.com/problems/merge-k-sorted-lists/description/

You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted linked-list and return it.

Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6


=end


# 67266
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


# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
	return nil if lists.nil?

	while lists.length > 1 do
		merged_list_arr = []

		(0..lists.length-1).step(2).each do |index|
			l1 = lists[index]
			l2 = ((index+1) < lists.length) ? lists[index+1] : nil
			merged_list_arr << merge_sorted_list(l1, l2)
		end
		lists = merged_list_arr
	end

	lists[0].inline
end

def merge_sorted_list(l1, l2)
	sorted_list = ListNode.new()
	dummy = sorted_list

	while !l1.nil? && !l2.nil? do
		sorted_list.next = ListNode.new()
		sorted_list = sorted_list.next
		
		if l1.val < l2.val
			sorted_list.val = l1.val
			l1 = l1.next
		else
			sorted_list.val = l2.val
			l2 = l2.next
		end
	end

	if !l1.nil?
		sorted_list.next = l1
	end

	if !l2.nil?
		sorted_list.next = l2
	end

	dummy.next
end


l1 = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
l2 = ListNode.new(1, ListNode.new(3, ListNode.new(4, ListNode.new(4, ListNode.new(5)))))
l3 = ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5, ListNode.new(6)))))

p merge_k_lists([l1, l2, l3])