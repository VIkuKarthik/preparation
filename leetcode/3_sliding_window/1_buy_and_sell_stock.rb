=begin

https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description

You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one 
stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. 
If you cannot achieve any profit, return 0.

Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.

=end

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  result = 0
  pointer_a = 0
  pointer_b = 1

  while pointer_b <= prices.length-1 do
    break if (pointer_a > pointer_b) || (pointer_b > prices.length-1)

    if prices[pointer_a] >= prices[pointer_b]
      pointer_a = pointer_b
    else
      max_price = prices[pointer_b] - prices[pointer_a]
      result = max_price if max_price > result
    end
    
    pointer_b += 1
  end
  result
end



p max_profit([7,1,5,3,6,4]) # 5
p max_profit([7,6,4,3,1]) # 0
p max_profit([2,1,2,1,0,1,2]) # 2
p max_profit([1,2,4,2,5,7,2,4,9,0,9]) # 9
p max_profit([1,2]) # 1