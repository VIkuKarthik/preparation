=begin
Course Schedule

There are a total of numCourses courses you have to take,
labeled from 0 to numCourses - 1.
You are given an array prerequisites where prerequisites[i] = [ai, bi]
indicates that you must take course bi first if you want to take course ai.

For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.

Return true if you can finish all courses. Otherwise, return false.

Example 1:

Input: numCourses = 2, prerequisites = [[1,0]]
Output: true
Explanation: There are a total of 2 courses to take.
To take course 1 you should have finished course 0. So it is possible.
=end


def can_finish(num_courses, prerequisites)
  hash = Hash.new {|h, k| h[k] = []}
  visited = Set.new

  prerequisites.each do |arr|
    hash[arr[0]] << arr[1]
  end

  dfs = ->(course) do
    return false if visited.include?(course)
    return true if hash[course] == []

    visited.add(course)
    hash[course].each do |value|
      return false unless dfs.call(value)
    end
    visited.delete(course)
    hash[course] = []
    return true
  end

  num_courses.times do |counter|
    return false unless dfs.call(counter)
  end
  true
end

num_courses = 5
# prerequisites = [[1, 0], [0, 1]]
# prerequisites = [[1, 0]]
prerequisites =[[1,4],[2,4],[3,1],[3,2]] # true
p can_finish(num_courses, prerequisites)
