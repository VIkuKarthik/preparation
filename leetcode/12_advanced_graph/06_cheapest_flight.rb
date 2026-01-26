=begin
Cheapest Flights Within K Stops

There are n cities connected by some number of flights.
You are given an array flights where flights[i] = [fromi, toi, pricei]
indicates that there is a flight from city fromi to city toi with cost pricei.

You are also given three integers src, dst, and k, return the cheapest
price from src to dst with at most k stops. If there is no such route, return -1.

Input: n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1
Output: 700
=end
require 'pry'
def find_cheapest_price(n, flights, src, dst, k)
  hash = Hash.new {|h, k| h[k] = []}

  flights.each do |dep, arri, price|
    hash[dep] << [price, arri]
  end
  p hash
  heap = []
  visited = Set.new
  result = 0
  heap.push([0, src])

  while !heap.empty?
    p "heap, #{heap}, visited: #{visited}"
    price, dest = heap.shift
    return result if visited.include?(dst)

    if k == 0
      find_dest = heap.detect {|arr| arr[1] == dst}
      if find_dest
        result += find_dest[0]
        return result
      else
        return -1
      end
    end

    if !visited.include?(dest)
      visited.add(dest)
      hash[dest].each do |pr, ar|
        heap.push([pr, ar])
        heap.sort!
      end
      k -= 1
      result += price
    end
  end
  result
end


# Relaxation - Iterative
def cheapest_dsa(n, flights, src, dst, k)
  prices = Array.new(n, Float::INFINITY)
  prices[src] = 0

  (k+1).times do
    temp = prices.dup
    flights.each do |source, dest, price|
      next if prices[source] == Float::INFINITY

      if (prices[source] + price) < temp[dest]
        temp[dest] = prices[source] + price
      end
    end
    prices = temp
  end
  prices[dst] == Float::INFINITY ? -1 : prices[dst]
end


n = 4
flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]]
src = 0
dst = 3
k = 1
p find_cheapest_price(n, flights, src, dst, k)
