=begin

https://leetcode.com/problems/median-of-two-sorted-arrays/description/

Given two sorted arrays nums1 and nums2 of size m and n respectively, 
return the median of the two sorted arrays.

The overall run time complexity should be O(log (m+n)).

Example
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.


Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

---
HINT:

Simulate: Merge two sorted array

Take the MIN length array as FIRST_ARR and MAX length array as SECOND_ARR

Find middle from FIRST_ARR and include that for the left side i.e., index[0..middle]

How to find the middle in SECOND_ARR
  (FIRST_ARR + SECOND_ARR)/2 - length of FIRST_ARR[0..middle] - 2('cause index)

Is this partition is correct?
  If MAX(SECOND_ARR)[FIRST PARTITION] <= MIN(FIRST_ARR)[SECOND PARTITION]

  If MAX(FIRST_ARR)[FIRST PARTITION] <= MIN(SECOND_ARR)[SECOND PARTITION]

=end


# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def fin_median(nums1, nums2)
  a, b = nums1, nums2
  total = nums1.length + nums2.length
  half = total / 2

  # a => array with smallest length
  if b.length < a.length
    a, b = b, a
  end

  l, r = 0, a.length - 1
  counter = 0
  while true do
    i = (l + r) / 2 # A
    j = (half - i) - 2 # B

    aleft = (i >= 0) ? a[i] : -(Float::INFINITY)
    aright = ( (i + 1) < (a.length) ) ? a[i + 1] : Float::INFINITY
    bleft = (j >= 0) ? b[j] : -(Float::INFINITY)
    bright = ( (j + 1) < (b.length) ) ? b[j + 1] : Float::INFINITY

    puts "========= Counter => #{counter+=1}=============="
    puts "aleft => #{aleft}"
    puts "aright => #{aright}"
    puts "bleft => #{bleft}"
    puts "bright => #{bright}"
    

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

p fin_median([1,2], [3,4])
# p fin_median([1, 4, 5, 6, 7, 8], [7, 8, 9])
# p fin_median([1,3], [2])
# p fin_median([1,2], [3,4])