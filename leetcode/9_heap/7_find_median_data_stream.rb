require 'pry'
=begin

Find Median from Data Stream

The median is the middle value in an ordered integer list.
If the size of the list is even, there is no middle value,
and the median is the mean of the two middle values.

- For example, for arr = [2,3,4], the median is 3.
- For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.

Implement the MedianFinder class:

- MedianFinder() initializes the MedianFinder object.
- void addNum(int num) adds the integer num from the data stream to the data structure.
- double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.

=end


class Heap
  attr_accessor :data

  def push(val)
    data << val
    parent_index = parent(data.length-1)
    compare_up(parent_index)
  end

  def pop
    return nil if data.length == 0
    return data.pop if data.length <= 1

    smallest_value = data[0]
    data[0] = data.pop
    compare_down(0)

    smallest_value
  end

  def size
    data.size
  end

  def min
    data[0]
  end

  def max
    data[-1]
  end

  def shift
    data.shift
  end

  protected

  def compare_up(parent_index)
    head = heapify(parent_index)

    compare_up(parent(parent_index)) if head && parent_index > 0
  end

  def compare_down(parent_index)
    head = heapify(parent_index)

    compare_down(head) if head
  end

  def heapify(parent_index)
    raise "no implementation"
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



class MaxHeap < Heap
  def initialize
    @data = []
  end

  private

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
end

class MinHeap < Heap
  def initialize
    @data = []
  end

  private

  def heapify(parent_index)
    head = parent_index
    left_index = left(parent_index)
    right_index = right(parent_index)

    head = left_index if data[left_index] && data[left_index] < data[head]
    head = right_index if data[right_index] && data[right_index] < data[head]

    return if head == parent_index

    data[parent_index], data[head] = data[head], data[parent_index]

    head
  end
end



class MedianFinder
  attr_accessor :min_heap, :max_heap

  def initialize
    @min_heap = MinHeap.new
    @max_heap = MaxHeap.new
  end

  def add_num(num)
    max_heap.push(num)

    min_heap.push(max_heap.pop)

    # balancing
    if max_heap.size < min_heap.size
      max_heap.push(min_heap.pop)
    end
  end

  def find_median
    if max_heap.size > min_heap.size
      max_heap.min
    else
      (max_heap.min + min_heap.min) / 2.0
    end
  end
end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new
# obj.add_num(5)
# param_2 = obj.find_median()

# p param_2



obj = MedianFinder.new

p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
obj.add_num(6) # 6.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(10) # 8.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(2) # 6.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(6) # 6.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(5) # 6.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(0) # 5.50000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(6) # 6.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(3) # 5.50000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(1) # 5.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(0) # 4.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
obj.add_num(0) # 3.00000
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
p obj.find_median
p "min_heap => #{obj.min_heap.data} max_heap => #{obj.max_heap.data}"
