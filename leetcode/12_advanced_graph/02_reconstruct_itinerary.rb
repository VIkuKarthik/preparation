=begin
Reconstruct Itinerary

You are given a list of airline tickets where tickets[i] = [fromi, toi]
represent the departure and the arrival airports of one flight.
Reconstruct the itinerary in order and return it.

All of the tickets belong to a man who departs from "JFK", thus,
the itinerary must begin with "JFK". If there are multiple valid itineraries,
you should return the itinerary that has the smallest lexical order when read as a single string.

For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].

You may assume all tickets form at least one valid itinerary.
You must use all the tickets once and only once.

Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
Output: ["JFK","MUC","LHR","SFO","SJC"]

Input: tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"] but it is larger in lexical order.
=end

def find_itinerary(tickets)
  hash = Hash.new {|h, k| h[k] = []}

  tickets.each do |ticket|
    hash[ticket[0]] << ticket[1]
  end

  hash.each {|k, v| hash[k] = v.sort}
  result = []

  dfs = ->(ticket) do
    while !hash[ticket].empty? && hash.key?(ticket) do
      dfs.call(hash[ticket].shift)
    end

    result.unshift(ticket)
  end
  dfs.call('JFK')
  result
end
# tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
# tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]

tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","JFK"],["ATL","AAA"],["AAA","ATL"],["ATL","BBB"],["BBB","ATL"],["ATL","CCC"],["CCC","ATL"],["ATL","DDD"],["DDD","ATL"],["ATL","EEE"],["EEE","ATL"],["ATL","FFF"],["FFF","ATL"],["ATL","GGG"],["GGG","ATL"],["ATL","HHH"],["HHH","ATL"],["ATL","III"],["III","ATL"],["ATL","JJJ"],["JJJ","ATL"],["ATL","KKK"],["KKK","ATL"],["ATL","LLL"],["LLL","ATL"],["ATL","MMM"],["MMM","ATL"],["ATL","NNN"],["NNN","ATL"]]
# output = ["JFK","SFO","JFK","ATL","AAA","ATL","BBB","ATL","CCC","ATL","DDD","ATL","EEE","ATL","FFF","ATL","GGG","ATL","HHH","ATL","III","ATL","JJJ","ATL","KKK","ATL","LLL","ATL","MMM","ATL","NNN","ATL"]

tickets = [["JFK", "BLR"], ["JFK", "CHE"], ["CHE", "JFK"]]
p find_itinerary(tickets)
