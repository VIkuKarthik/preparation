=begin

Task Scheduler

You are given an array of CPU tasks, each labeled with a letter from A to Z, and a number n.
Each CPU interval can be idle or allow the completion of one task.
Tasks can be completed in any order, but there's a constraint:
there has to be a gap of at least n intervals between two tasks with the same label.

Return the minimum number of CPU intervals required to complete all tasks.

Example 1:

Input: tasks = ["A","A","A","B","B","B"], n = 2

Output: 8

Explanation: A possible sequence is: A -> B -> idle -> A -> B -> idle -> A -> B.

After completing task A, you must wait two intervals before doing A again.
The same applies to task B. In the 3rd interval, neither A nor B can be done,
so you idle. By the 4th interval, you can do A again as 2 intervals have passed.




Example 2:

Input: tasks = ["A","C","A","B","D","B"], n = 1

Output: 6

Explanation: A possible sequence is: A -> B -> C -> D -> A -> B.

With a cooling interval of 1, you can repeat a task after just one other task.




Example 3:

Input: tasks = ["A","A","A", "B","B","B"], n = 3

Output: 10

Explanation: A possible sequence is: A -> B -> idle -> idle -> A -> B -> idle -> idle -> A -> B.

There are only two types of tasks, A and B, which
need to be separated by 3 intervals. This leads to idling twice between repetitions of these tasks.

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
    return data.pop if data.length == 1

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
    (index - 1) / 2
  end

end


def least_interval(tasks, n)
  heap = MaxHeap.new
  frequency = tasks.tally.values
  time = 0
  queue = []

  frequency.each {|freq| heap.push(freq) }

  while !heap.data.empty? || !queue.empty? do
    time += 1

    p "time => #{time}, heap => #{heap.data}, queue => #{queue}"

    if !heap.data.empty?
      frequency = heap.pop - 1

      if frequency > 0
        queue.append( [frequency, time + n] )
      end
    end

    if !queue.empty? && queue[0][1] == time
      heap.push(queue.shift[0])
    end
  end

  time
end

# tasks, n = ["A","C","A","B","D","B"], 1
tasks, n = ["A","A","A","B","B","B"], 2
p least_interval(tasks, n)
