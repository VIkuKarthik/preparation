=begin
	Construct a Heap
=end
require 'pry'

class MinHeap
	attr_accessor :data

	def initialize
		@data = []
	end

	def push(val)
		data.push(val)
		parent_index = parent(data.length-1)
		compare_up(parent_index)
	end

	def pop
		return nil if data.length == 0

		smallest_value = data[0]
		data[0] = data.pop
		compare_down(0)

		smallest_value
	end

	private

	def compare_up(parent_index)
		head = heapify(parent_index)

		compare_up(parent(parent_index)) if head && parent_index > 0
	end

	def compare_down(parent_index)
		head = heapify(parent_index)

		compare_down(head) if head
	end

	def heapify(parent_index)
		left_index = left(parent_index)
		right_index = right(parent_index)

		head = parent_index
		head = left_index if data[left_index] && data[left_index] < data[head]
		head = right_index if data[right_index] && data[right_index] < data[head]

		return if head == parent_index

		data[parent_index], data[head] = data[head], data[parent_index]
		head
	end

	def left(index)
		2 * index + 1
	end

	def right(index)
		2 * index + 2
	end

	def parent(index)
		(index - 1) / 2
	end
end


def heap_sort(input)
	heap = MinHeap.new
	result = []
	input.each {|ele| heap.push(ele)}
	input.each { |ele| result << heap.pop }
	result
end


p heap_sort([1, 2, 4, 6, 7, 3, 4])
