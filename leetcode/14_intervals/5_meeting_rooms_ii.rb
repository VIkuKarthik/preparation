=begin
  Meeting Rooms II

  Given an array of meeting time interval objects consisting
  of start and end times [[start_1,end_1],[start_2,end_2],...] (start_i < end_i),
  find the minimum number of days required to schedule all meetings without any conflicts.

  Note: (0,8),(8,10) is not considered a conflict at 8.

  Example:

  Input: intervals = [(0,40),(5,10),(15,20)]
  Output: 2

  Explanation:
  day1: (0,40)
  day2: (5,10),(15,20)

  Example:

  Input: intervals = [(4,9)]
  Output: 1
=end

require "pry"

def meeting_rooms_ii(intervals)
  result = 0
  start_times = intervals.sort!.map {|arr| arr[0]}
  end_times = intervals.sort_by {|arr| arr[1] }.map {|arr| arr[1]}

  pointer_a = 0
  pointer_b = 0
  counter = 0

  while pointer_a < start_times.length do
    if start_times[pointer_a] < end_times[pointer_b]
      counter += 1
      pointer_a += 1
    else
      counter -= 1
      pointer_b += 1
    end
    result = [counter, result].max
  end
  result
end

intervals = [[0,40], [5,10], [15,20]]
p meeting_rooms_ii(intervals)
