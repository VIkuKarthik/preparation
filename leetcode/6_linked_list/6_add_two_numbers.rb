=begin

https://leetcode.com/problems/add-two-numbers/description/

Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.

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
		@inline.inspect
	end

	private

	def get_next(list)
		@inline << list.val
		get_next(list.next) if list.next
	end
end


def add_two_numbers(l1, l2)
	result = ListNode.new(0)
	head = result
	n1 = l1
	n2 = l2
	carry = 0

	while !n1.nil? || !n2.nil? || carry != 0
		n1_val = n1.val || 0
		n2_val = n2.val || 0

		sum = n1_val + n2_val + carry

		carry = sum / 10
		if sum>9
			sum = sum % 10
		end

		n1 = n1.next
		n2 = n2.next
		result.next = ListNode.new(sum)
		result = result.next
	end
	head.next
end


l1 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
l2 = ListNode.new(5, ListNode.new(6, ListNode.new(4)))

puts add_two_numbers(l1, l2).inline