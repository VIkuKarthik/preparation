=begin

https://leetcode.com/problems/daily-temperatures/description/

Given an array of integers temperatures represents the daily temperatures, 
return an array answer such that answer[i] is the number 
of days you have to wait after the ith day to 
get a warmer temperature. If there is no future day 
for which this is possible, keep answer[i] == 0 instead.

Input: temperatures = [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]

Input: temperatures = [30,40,50,60]
Output: [1,1,1,0]

Input: temperatures = [30,60,90]
Output: [1,1,0]

=end

# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  res = [0]*temperatures.length

  stack = []

  temperatures.each_with_index do |temperature, index|
    while !stack.empty? && stack[-1][1] < temperature do
      last = stack.pop
      res[last[2]] = (index - last[2])
      stack << [0, temperature, index] if (!stack.empty? && stack[-1][1] > temperature)
    end
    stack << [0, temperature, index] if (!stack.empty? && stack[-1][1] == temperature)
    stack << [0, temperature, index] if stack.empty? || stack[-1][1] > temperature
    # stack << [0, temperature, index]
  end
  res
end

p daily_temperatures([73,74,75,71,69,72,76,73])
p daily_temperatures([89,62,70,58,47,47,46,76,100,70]) # [8,1,5,4,3,2,1,1,0,0]