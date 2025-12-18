=begin
  Non-overlapping Intervals

  Given an array of intervals intervals where intervals[i] = [starti, endi],
  return the minimum number of intervals you need to remove
  to make the rest of the intervals non-overlapping.

  Note that intervals which only touch at a point
  are non-overlapping. For example, [1, 2] and [2, 3] are non-overlapping.

  Example 1:

  Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
  Output: 1
  Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.


  Example 2:

  Input: intervals = [[1,2],[1,2],[1,2]]
  Output: 2
  Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.
=end

def erase_overlap_intervals(intervals)
  intervals.sort!
  result = 0
  prev_end = intervals[0][1]

  intervals[1..].each do |start_time, end_time|
    if start_time >= prev_end
      prev_end = end_time
    else
      result += 1
      prev_end = [end_time, prev_end].min
    end
  end
  result
end

# intervals = [[1,2],[2,3],[3,4],[1,3]]
# intervals = [[1,2],[1,2],[1,2]]
intervals = [[1,100],[11,22],[1,11],[2,12]] # 2
# intervals = [[-52,31],[-73,-26],[82,97],[-65,-11],[-62,-49],[95,99],[58,95],[-31,49],[66,98],[-63,2],[30,47],[-40,-26]] # 7
p erase_overlap_intervals(intervals)
