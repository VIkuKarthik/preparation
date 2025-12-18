=begin
  Meeting Rooms

  Given an array of meeting time interval objects consisting of
  start and end times [[start_1,end_1],[start_2,end_2],...] (start_i < end_i),
  determine if a person could add all meetings to their schedule without any conflicts.

  Note: (0,8),(8,10) is not considered a conflict at 8

  Example: 1

  Input: intervals = [(0,30),(5,10),(15,20)]
  Output: false
  Explanation:
  (0,30) and (5,10) will conflict
  (0,30) and (15,20) will conflict

  Example: 2

  Input: intervals = [(5,8),(9,15)]
  Output: true
=end


def can_attend_meetings(intervals)
  intervals.sort!

  intervals.each_with_index do |interval, index|
    next if index == 0
    return false if intervals[index-1][1] > interval[0]
  end
  true
end

# intervals = [[0,30], [5,10], [15,20]]
intervals = [[0,30], [30,35], [35,40], [36, 43]]
p can_attend_meetings(intervals)
