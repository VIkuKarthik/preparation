# Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

# Implement the MinStack class:

# MinStack() initializes the stack object.
# void push(int val) pushes the element val onto the stack.
# void pop() removes the element on the top of the stack.
# int top() gets the top element of the stack.
# int getMin() retrieves the minimum element in the stack.
# You must implement a solution with O(1) time complexity for each function.

 


class MinStack
  def initialize()
    @stack = []
    @min_stack = []
  end


=begin
  :type val: Integer
  :rtype: Void
=end
  def push(val)
    @stack << val
    if @min_stack.empty?
      @min_stack << val
    else
      min_val = [val, @min_stack[-1]].min
      @min_stack << min_val
    end
  end


=begin
  :rtype: Void
=end
  def pop()
    @stack.pop
    @min_stack.pop
  end


=begin
  :rtype: Integer
=end
  def top()
    @stack[-1]
  end


=begin
  :rtype: Integer
=end
  def get_min()
    @min_stack[-1]
  end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()