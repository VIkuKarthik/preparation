=begin
Course Schedule II

There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1.
You are given an array prerequisites where
prerequisites[i] = [ai, bi] indicates that you must take
course bi first if you want to take course ai.

For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.

Return the ordering of courses you should take to finish all courses.
If there are many valid answers, return any of them.
If it is impossible to finish all courses, return an empty array.


Example 1:
Input: numCourses = 2, prerequisites = [[1,0]]
Output: [0,1]
Explanation: There are a total of 2 courses to take. To take course 1 you
should have finished course 0. So the correct course order is [0,1].
=end

def find_order(num_courses, prerequisites)
  hash = Hash.new {|h, k| h[k] = []}
  visited, cycle = Set.new, Set.new
  result = []

  prerequisites.each do |arr|
    hash[arr[0]] << arr[1]
  end

  dfs = ->(course) do
    return false if cycle.include?(course)
    return true if visited.include?(course)

    cycle.add(course)
    hash[course].each do |preq|
      return false unless dfs.call(preq)
    end
    visited.add(course)
    cycle.delete(course)
    result << course
    true
  end

  num_courses.times do |course|
    return [] unless dfs.call(course)
  end
  result
end
# numCourses = 2
# prerequisites = [[1,0]]
# numCourses = 4
# prerequisites = [[1,0],[2,0],[3,1],[3,2]]
numCourses = 2
prerequisites = [[0,1]]
p find_order(numCourses, prerequisites)
