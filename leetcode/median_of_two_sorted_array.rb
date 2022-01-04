# Input: nums1 = [1,3], nums2 = [2]
# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.

# Input: nums1 = [1,2], nums2 = [3,4]
# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  merged_array = nums1 + nums2
  length = merged_array.length
  middle = length / 2
  if length.even?
    result = (merged_array[middle] + merged_array[middle -1]) / 2.0
  else
    result = merged_array[middle]
  end
  result
end

puts find_median_sorted_arrays([1,3], [2])
puts find_median_sorted_arrays([1,2], [3,4])