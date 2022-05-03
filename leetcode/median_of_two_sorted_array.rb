# Input: nums1 = [1,3], nums2 = [2]
# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.

# Input: nums1 = [1,2], nums2 = [3,4]
# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def fin_median(nums1, nums2)
  a, b = nums1, nums2
  total = nums1.length + nums2.length
  half = total / 2

  if b.length < a.length
    a, b = b, a
  end

  l, r = 0, a.length - 1

  while true do
    i = (l + r) / 2 # A
    j = (half - i) - 2 # B

    aleft = (i >= 0) ? a[i] : -(Float::INFINITY)
    aright = ( (i + 1) < (a.length) ) ? a[i + 1] : Float::INFINITY
    bleft = (j >= 0) ? b[j] : -(Float::INFINITY)
    bright = ( (j + 1) < (b.length) ) ? b[j + 1] : Float::INFINITY


    # partition is correct
    if aleft <= bright and bleft <= aright
      
      # odd
      if (total % 2) != 0
        return [aright, bright].min
      end
      # even
      return ([aleft, bleft].max + [aright, bright].min) / 2
    elsif aleft > bright
      r = i - 1
    else
      l = i + 1
    end
  end

end

puts fin_median([1,2], [3,4])
puts fin_median([1, 4, 5, 6, 7, 8, ], [7, 8, 9])
puts fin_median([1,3], [2])
puts fin_median([1,2], [3,4])