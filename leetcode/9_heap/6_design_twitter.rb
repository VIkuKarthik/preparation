require 'pry'
=begin

Design Twitter

Design a simplified version of Twitter where users can post tweets,
follow/unfollow another user, and is able to see the 10 most recent tweets in the user's news feed.

Implement the Twitter class:

- Twitter() Initializes your twitter object.

- void postTweet(int userId, int tweetId) Composes a new tweet with ID tweetId by the user userId.
  Each call to this function will be made with a unique tweetId.

- List<Integer> getNewsFeed(int userId) Retrieves the 10 most recent tweet IDs in the user's news feed.
  Each item in the news feed must be posted by users who the user followed or by the user themself.
  Tweets must be ordered from most recent to least recent.


- void follow(int followerId, int followeeId) The user with ID followerId started following
  the user with ID followeeId.

- void unfollow(int followerId, int followeeId) The user with ID followerId
  started unfollowing the user with ID followeeId.


Example 1:

Input
["Twitter", "postTweet", "getNewsFeed", "follow", "postTweet", "getNewsFeed", "unfollow", "getNewsFeed"]
[[], [1, 5], [1], [1, 2], [2, 6], [1], [1, 2], [1]]
Output
[null, null, [5], null, null, [6, 5], null, [5]]

Explanation
Twitter twitter = new Twitter();
twitter.postTweet(1, 5); // User 1 posts a new tweet (id = 5).
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5]. return [5]
twitter.follow(1, 2);    // User 1 follows user 2.
twitter.postTweet(2, 6); // User 2 posts a new tweet (id = 6).
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 2 tweet ids -> [6, 5]. Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
twitter.unfollow(1, 2);  // User 1 unfollows user 2.
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5], since user 1 is no longer following user 2.

=end


class MaxHeap
  attr_accessor :data

  def initialize
    @data = []
  end

  def push(val)
    data << val

    compare_up(parent(data.length - 1))
  end

  def pop
    return nil if data.length == 0

    return data.pop if data.length < 2

    smallest_value = data[0]
    data[0] = data.pop
    compare_down(0)

    smallest_value
  end

  private

  def compare_up(parent_index)
    head = heapify(parent_index)

    compare_up(parent(parent_index)) if head && parent_index > 0
  end

  def compare_down(parent_index)
    head = heapify(parent_index)

    compare_down(head) if head
  end

  def heapify(parent_index)
    head = parent_index
    left_index = left(parent_index)
    right_index = right(parent_index)

    head = left_index if data[left_index] && data[left_index][0] > data[head][0]
    head = right_index if data[right_index] && data[right_index][0] > data[head][0]

    return if head == parent_index

    data[parent_index], data[head] = data[head], data[parent_index]

    head
  end

  def left(index)
    (2 * index) + 1
  end

  def right(index)
    (2 * index) + 2
  end

  def parent(index)
    (index - 1) / 2
  end
end


class Twitter
  attr_accessor :follows, :tweets, :counter

  def initialize
    @follows = Hash.new {|hash, key| hash[key] = Set.new }
    @tweets = Hash.new {|hash, key| hash[key] = [] }
    @counter = 0
  end

  def post_tweet(user_id, tweet_id)
    tweets[user_id] << [counter, tweet_id]
    self.counter += 1
  end

  def get_news_feed(user_id)
    heap = MaxHeap.new
    result = []
    followers = follows[user_id]
    followers << user_id

    followers.each do |follower|
      tweet_lists = tweets[follower]
      tweet_lists.each do |list|
        heap.push(list)
      end
    end

    while !heap.data.empty? && result.length < 10
      result << heap.pop[1]
    end

    result
  end

  def follow(follower_id, followee_id)
    follows[follower_id] << followee_id
  end

  def unfollow(follower_id, followee_id)
    if follows[follower_id]
      follows[follower_id].delete(followee_id)
    end
  end
end

# # Your Twitter object will be instantiated and called as such:
# twitter = Twitter.new
# twitter.post_tweet(1, 5); # User 1 posts a new tweet (id = 5).
# lists = twitter.get_news_feed(1);  # User 1's news feed should return a list with 1 tweet id -> [5]. return [5]
# p lists
# twitter.follow(1, 2);    # User 1 follows user 2.
# twitter.post_tweet(2, 6); # User 2 posts a new tweet (id = 6).
# list1 = twitter.get_news_feed(1);  # User 1's news feed should return a list with 2 tweet ids -> [6, 5]. Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
# p list1
# twitter.unfollow(1, 2);  # User 1 unfollows user 2.
# twitter.get_news_feed(1);  # User 1's news feed should return a list with 1 tweet id -> [5], since user 1 is no longer following user 2.




twitter = Twitter.new
twitter.post_tweet(1,5)
twitter.post_tweet(1,3)
twitter.post_tweet(1,101)
twitter.post_tweet(1,13)
twitter.post_tweet(1,10)
twitter.post_tweet(1,2)
twitter.post_tweet(1,94)
twitter.post_tweet(1,505)
twitter.post_tweet(1,333)
twitter.post_tweet(1,22)
twitter.post_tweet(1,11)
p twitter.get_news_feed(1)
