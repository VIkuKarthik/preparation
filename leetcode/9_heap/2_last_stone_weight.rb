=begin

You are given an array of integers stones where stones[i] is the weight of the ith stone.

We are playing a game with the stones.
On each turn, we choose the heaviest two stones and smash them together.
Suppose the heaviest two stones have weights x and y with x <= y. The result of this smash is:

If x == y, both stones are destroyed, and
If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x.
At the end of the game, there is at most one stone left.

Return the weight of the last remaining stone. If there are no stones left, return 0.


Example 1:

Input: stones = [2,7,4,1,8,1]
Output: 1
Explanation:
We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of the last stone.

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
    2 * index + 1
  end

  def right(index)
    2 * index + 2
  end

  def parent(index)
    (index - 1) / 2
  end
end


def last_stone_weight(stones)
  heap = MaxHeap.new
  stones.each {|stone| heap.push(stone)}

  while heap.data.length > 1 do
    heap_length = heap.data.length
    first_val = heap.pop
    second_val = heap.pop
    diff = (first_val - second_val).abs

    return diff if heap_length == 2

    heap.push(diff) if first_val != second_val
  end
  heap.data[0]
end

stones = [2,7,4,1,8,1] # 1
stones = [1, 3] # 2
p last_stone_weight(stones)
