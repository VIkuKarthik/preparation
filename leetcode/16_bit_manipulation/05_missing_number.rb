=begin

=end

def missing_number(nums)
  total = nums.length

  (nums.length).times do |counter|
    total += counter - nums[counter]
  end
  total
end


nums = [4,0,1,2]
p missing_number(nums)
