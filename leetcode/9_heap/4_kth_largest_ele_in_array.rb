=begin

Kth Largest Element in an Array

Given an integer array nums and an integer k, return the kth largest element in the array.

Note that it is the kth largest element in the sorted order, not the kth distinct element.

Can you solve it without sorting?


Example 1:

Input: nums = [3,2,1,5,6,4], k = 2
Output: 5
Example 2:

Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
Output: 4

=end



class MaxHeap
  attr_accessor :data

  def initialize
    @data = []
  end

  def push(val)
    data << val
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
    head = parent_index
    left_index = left(parent_index)
    right_index = right(parent_index)

    head = left_index if data[left_index] && data[left_index] > data[head]
    head = right_index if data[right_index] && data[right_index] > data[head]

    return if head == parent_index

    data[parent_index], data[head] = data[head], data[parent_index]

    head
  end

  def left(index)
    (2 * index) + 1
  end

  def right(index)
    (2 * index) + 2
  end

  def parent(index)
    (index-1) / 2
  end
end

def find_kth_largest(nums, k)
  heap = MaxHeap.new
  result = heap.data[0]

  nums.each {|num| heap.push(num)}

  while k > 0
    result = heap.pop
    k -= 1
  end
  result
end


nums, k = [3,2,1,5,6,4], 2
p find_kth_largest(nums, k)
