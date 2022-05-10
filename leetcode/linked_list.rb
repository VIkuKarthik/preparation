# Linked List

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList

  def initialize(value)
    @head = Node.new(value)
  end

  # check if list is empty
  def is_empty?
    return @head == nil
  end

  # add new node to the next
  def append(value)
    if self.is_empty?
      @head = Node.new(value)
    else
      new_node = Node.new(value)
      @head.next_node = new_node
    end
  end

  # remove the first node and return it
  def shift
    return false if self.is_empty?

    current_head = @head
    @head = current_head.next_node
    current_head
  end

  # add a new node in the front
  def unshift(value)
    if self.is_empty?
      @head = Node.new(value)
    else
      current_head = @head
      @head = Node.new(value)
      @head.next_node = current_head
    end
  end

  # remove the last node and return it
  def pop
    return false if self.is_empty?

    last_node = @head
    while last_node.next_node != nil do
      prev_node = last_node
      last_node = last_node.next_node
    end

    prev_node.next_node = nil
    last_node.inspect
  end

  # return the length of the list
  def size
    return 0 if self.is_empty?
    
    count = 1
    last_node = @head
    while last_node.next_node != nil do
      last_node = last_node.next_node
      count += 1
    end
    count
  end

  def find(value)
    return false if self.is_empty?

    current_node = @head
    while current_node != nil do
      return current_node if current_node.value == value
      current_node = current_node.next_node
    end
  end

  # make list nil
  def clear
    @head = nil
  end
  
end


linked_list = LinkedList.new(4)

linked_list.is_empty?

linked_list.append(10)

linked_list.unshift(100)

linked_list.pop

linked_list.shift

linked_list.size

linked_list.find(4)

linked_list.clear


puts "------------"
puts linked_list.inspect