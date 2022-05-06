# Design a time-based key-value data structure that can store multiple values 
# for the same key at different time stamps and retrieve the key's value at a certain timestamp.

# Implement the TimeMap class:

# TimeMap() Initializes the object of the data structure.
# void set(String key, String value, int timestamp) Stores 
# the key key with the value value at the given time timestamp.
# String get(String key, int timestamp) Returns a value such that set was called previously, 
# with timestamp_prev <= timestamp. If there are multiple such values, 
# it returns the value associated with the largest timestamp_prev. If there are no values, it returns "".


# Example 1:

# Input
# ["TimeMap", "set", "get", "get", "set", "get", "get"]
# [[], ["foo", "bar", 1], ["foo", 1], ["foo", 3], ["foo", "bar2", 4], ["foo", 4], ["foo", 5]]
# Output
# [null, null, "bar", "bar", null, "bar2", "bar2"]

# Explanation
# TimeMap timeMap = new TimeMap();
# timeMap.set("foo", "bar", 1);  // store the key "foo" and value "bar" along with timestamp = 1.
# timeMap.get("foo", 1);         // return "bar"
# timeMap.get("foo", 3);         // return "bar", since there is no value corresponding 
#                                // to foo at timestamp 3 and timestamp 2, then the only value is at timestamp 1 is "bar".
# timeMap.set("foo", "bar2", 4); // store the key "foo" and value "bar2" along with timestamp = 4.
# timeMap.get("foo", 4);         // return "bar2"
# timeMap.get("foo", 5);         // return "bar2"
 


class TimeMap
  def initialize()
    @hash = Hash.new{|h, k| h[k] = []}
  end


=begin
  :type key: String
  :type value: String
  :type timestamp: Integer
  :rtype: Void
=end
  def set(key, value, timestamp)
    @hash[key] << [value, timestamp]
    return nil
  end

=begin
  :type key: String
  :type timestamp: Integer
  :rtype: String
=end
  def get(key, timestamp)
    values = @hash[key]
    return "" if values.empty?
    return values[0][0] if (values.length == 1) || (values[0][1] == timestamp)

    left = 0
    right = values.length-1

    return "" if values[left][1] > timestamp

    while left <= right do
      middle = (left + right) / 2
      return values[middle][0] if values[middle][1] == timestamp
      
      if timestamp > values[middle][1]
        left = middle + 1
      else
        right = middle - 1
      end
      return values[middle-1][0] if (values[middle][1] > timestamp) and (values[middle-1][1] < timestamp)

      return values[-1][0] if values[-1][1] < timestamp

    end
    
    return nil
  end

end

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap.new()
# obj.set("foo", "bar", 1)
# param_2 = obj.get("foo", 1)
# puts param_2.inspect

# timeMap = TimeMap.new();
# puts timeMap.set("foo", "bar", 1);  # store the key "foo" and value "bar" along with timestamp = 1.
# puts timeMap.get("foo", 1).inspect         # return "bar"
# puts timeMap.get("foo", 3).inspect         # return "bar", since there is no value corresponding to foo at timestamp 3 and timestamp 2, then the only value is at timestamp 1 is "bar".
# puts timeMap.set("foo", "bar2", 4); # store the key "foo" and value "bar2" along with timestamp = 4.
# puts timeMap.get("foo", 4).inspect         # return "bar2"
# puts timeMap.get("foo", 5).inspect         # return "bar2"

# ["TimeMap","set","set","get","get","get","get","get"]
# [[],["love","high",10],["love","low",20],["love",5],["love",10],["love",15],["love",20],["love",25]]


# timeMap = TimeMap.new();
# timeMap.set("love", "high", 10)
# timeMap.set("love", "low", 20)
# puts timeMap.get("love", 5).inspect   # ""
# puts timeMap.get("love", 10).inspect  # high
# puts timeMap.get("love", 15).inspect  # high
# puts timeMap.get("love", 20).inspect  # low
# puts timeMap.get("love", 25).inspect  # low


# ["TimeMap","set","set","get","set","get","get"]
# [[],["a","bar",1],["x","b",3],["b",3],["foo","bar2",4],["foo",4],["foo",5]]

# timeMap = TimeMap.new();
# timeMap.set("a", "bar", 1)
# timeMap.set("x", "b", 3)
# puts timeMap.get("b", 3).inspect  
# puts timeMap.set("foo", "bar2", 4).inspect  
# puts timeMap.get("foo", 4).inspect  
# puts timeMap.get("foo", 5).inspect  