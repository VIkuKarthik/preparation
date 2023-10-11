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