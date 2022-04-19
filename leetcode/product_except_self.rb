# Input: nums = [1,2,3,4]
# Output: [24,12,8,6]


# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    res = []
    left = []
    right = []

    prefix = 1
    nums.each_with_index do |num, index|
      left <<  prefix * num
      prefix = prefix * num
    end

    postfix = 1
    nums.reverse_each do |num, index|
      right.unshift(postfix * num)
      postfix = postfix * num
    end

    nums.each_with_index do |num, index|
      if (index == 0)
        res << 1 * right[(index+1)].to_i
      elsif index == nums.length-1
        res << left[(index - 1).to_i.abs] * 1
      else
        res << left[(index - 1).to_i.abs] * right[(index+1)].to_i
      end
    end
    res
end


# Method Two Inplace

def product_except_self(nums)
  res = []

  prefix = 1
  nums.each_with_index do |num, index|
    res[index] = prefix
    prefix *= num
  end

  postfix = 1
  nums.reverse.each_with_index do |num, index|
    res[(nums.length-1) - index] *= postfix
    postfix *= num
  end
  res
end

puts product_except_self([1,2,3,4])
puts product_except_self([-1,1,0,-3,3])
puts product_except_self([0,0])
puts product_except_self([1,1])
puts product_except_self([1,2,3,4])  # [24,12,8,6]
puts product_except_self([1,-1])    # [-1, 1]