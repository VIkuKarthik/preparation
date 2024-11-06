=begin

You are part of a university admissions office and need to keep
track of the kth highest test score from applicants in real-time.
This helps to determine cut-off marks for interviews and admissions
dynamically as new applicants submit their scores.

You are tasked to implement a class which, for a given integer k,
maintains a stream of test scores and continuously returns
the kth highest test score after a new score has been submitted.
More specifically, we are looking for the kth highest
score in the sorted list of all scores.

Implement the KthLargest class:

KthLargest(int k, int[] nums) Initializes the object with
the integer k and the stream of test scores nums.

int add(int val) Adds a new test score val to the
stream and returns the element representing the
kth largest element in the pool of test scores so far.


Input:
["KthLargest", "add", "add", "add", "add", "add"]
[[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]

Output: [null, 4, 5, 5, 8, 8]

Explanation:

KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
kthLargest.add(3); // return 4
kthLargest.add(5); // return 5
kthLargest.add(10); // return 5
kthLargest.add(9); // return 8
kthLargest.add(4); // return 8

=end


class MinHeap
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

    head = left_index if data[left_index] && data[left_index] < data[head]
    head = right_index if data[right_index] && data[right_index] < data[head]

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


class KthLargest

  def initialize(k, nums)
    @heap = MinHeap.new
    @max_size = k + 1
    @counter = 0
    construct_heap(nums)
  end

  def add(val)
    @heap.push(val)
    @counter += 1 if @counter < @max_size

    @heap.pop if @counter == @max_size
    @heap.data[0]
  end

  private

  def construct_heap(nums)
    nums.each {|num| add(num) }
  end
end

# kthLargest = KthLargest.new(3, [4, 5, 8, 2]);
# p kthLargest.add(3); # return 4
# p kthLargest.add(5); # return 5
# p kthLargest.add(10); # return 5
# p kthLargest.add(9); # return 8
# p kthLargest.add(4); # return 8


[[4,[7,7,7,7,8,3]],[2],[10],[9],[9]]

kthLargest = KthLargest.new(4, [7,7,7,7,8,3]);
p kthLargest.add(2)
p kthLargest.add(10)
p kthLargest.add(9)
p kthLargest.add(9)
