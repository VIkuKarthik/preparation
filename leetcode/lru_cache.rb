# Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

# Implement the LRUCache class:

# LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
# int get(int key) Return the value of the key if the key exists, otherwise return -1.
# void put(int key, int value) Update the value of the key if the key exists.
# Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
# The functions get and put must each run in O(1) average time complexity.


# Example 1:

# Input
# ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
# [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
# Output
# [null, null, null, 1, null, -1, null, -1, 3, 4]

# Explanation
# LRUCache lRUCache = new LRUCache(2);
# lRUCache.put(1, 1); // cache is {1=1}
# lRUCache.put(2, 2); // cache is {1=1, 2=2}
# lRUCache.get(1);    // return 1
# lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
# lRUCache.get(2);    // returns -1 (not found)
# lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
# lRUCache.get(1);    // return -1 (not found)
# lRUCache.get(3);    // return 3
# lRUCache.get(4);    // return 4


class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key, val, prev = nil, next_val = nil)
    @key = key
    @val = val
    @prev = prev
    @next = next_val
  end
end

class LRUCache
  attr_accessor :cache, :capacity, :left, :right

  # :type capacity: Integer
  def initialize(capacity)
    @capacity = capacity
    @cache = Hash.new

    @left, @right = Node.new(0, 0), Node.new(0, 0)
    left.next, right.prev = @right, @left
  end
  
  
  # :type key: Integer
  # :rtype: Integer
  def get(key)
    if cache[key]
      remove(cache[key])
      insert(cache[key])
      return cache[key].val
    end
    return -1
  end
  
  
  # :type key: Integer
  # :type value: Integer
  # :rtype: Void
  def put(key, value)
    if cache.has_key?(key)
      remove(cache[key])
    end
    cache[key] = Node.new(key, value)
    insert(cache[key])

    if cache.length > capacity
      lru = left.next
      remove(lru)
      cache.delete(lru.key)
    end

    nil
  end


  private

  # remove at left
  def remove(node)  
    nxt, prev = node.next, node.prev
    prev.next, nxt.prev = nxt, prev
  end

  # insert at right
  def insert(node)
    prev, nxt = right.prev, right
    prev.next = nxt.prev = node
    node.next, node.prev = nxt, prev
  end
  
end
  
# Your LRUCache object will be instantiated and called as such:
obj = LRUCache.new(2)
obj.put(1, 1)
obj.put(2, 2)
puts obj.get(1)
obj.put(3, 3)
puts obj.get(2)
obj.put(4, 4)
puts obj.get(1)
puts obj.get(3)
puts obj.get(4)