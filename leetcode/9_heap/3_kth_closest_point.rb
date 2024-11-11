=begin

K Closest Points to Origin

Given an array of points where points[i] = [xi, yi]
represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0).

The distance between two points on the X-Y plane is the Euclidean distance (i.e., √(x1 - x2)2 + (y1 - y2)2).

You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).

Example
Input: points = [[1,3],[-2,2]], k = 1
Output: [[-2,2]]
Explanation:
The distance between (1, 3) and the origin is sqrt(10).
The distance between (-2, 2) and the origin is sqrt(8).
Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
We only want the closest k = 1 points from the origin, so the answer is just [[-2,2]].


=end

class MinHeap
  attr_accessor :data

  def initialize
    @data = []
  end

  def push(val)
    data << val

    parent_index = parent(data.length - 1)
    compare_up(parent_index)
  end

  def pop
    return nil if data.length == 0

    smallest_value = data[0]
    data[0] = data.pop
    compare_down(0)

    smallest_value[1]
  end

  private

  def compare_up(parent_index)
    heap = heapify(parent_index)

    compare_up(parent(parent_index)) if heap && parent_index > 0
  end

  def compare_down(parent_index)
    heap = heapify(parent_index)

    compare_down(heap) if heap
  end


  def heapify(parent_index)
    head = parent_index
    left_index = left(parent_index)
    right_index = right(parent_index)

    head = left_index if data[left_index] && data[left_index][0] < data[head][0]
    head = right_index if data[right_index] && data[right_index][0] < data[head][0]

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




def k_closest(points, k)
  heap = MinHeap.new
  result = []

  points.each do |point|
    diff = (point[0] ** 2) + (point[1] ** 2)
    heap.push([diff, point])
  end

  while k > 0
    result << heap.pop
    k -= 1
  end
  result
end

# points, k = [[1,3],[-2,2]], 1 # [[-2,2]]
# points, k = [[0,1],[1,0]], 2 # [[0,1],[1,0]]
points, k = [[1,3],[-2,2],[2,-2]], 2 # [[-2,2],[2,-2]]
p k_closest(points, k)
