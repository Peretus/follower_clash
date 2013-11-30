require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'foreman'
require 'pry'

module UserComparer
  class User
    attr_reader :username, :followers, :following, :created_at, :most_recent_tweeter, :last_tweet, :last_tweet_time

    def initialize(username)
      @username = username

      client = Twitter::REST::Client.new do |config|
        config.consumer_key         = ENV["consumer_key"]
        config.consumer_secret      = ENV["consumer_secret"]
        config.access_token         = ENV["access_token"]
        config.access_token_secret  = ENV["access_token_secret"]
      end
      @followers = client.user(@username).followers_count
      @following = client.user(@username).friends_count
      @created_at = client.user(@username).created_at
      @last_tweet = client.user(@username).status.text
      @last_tweet_time = client.user(@username).status.created_at


    end

    # def followers
    #   client = Twitter::REST::Client.new do |config|
    #     config.consumer_key         = ENV["consumer_key"]
    #     config.consumer_secret      = ENV["consumer_secret"]
    #     config.access_token         = ENV["access_token"]
    #     config.access_token_secret  = ENV["access_token_secret"]
    #   end
  #     client.user(@username).followers_count
  #   end
  end

  class Comparer
    attr_reader :followers
    def initialize(user1, user2)
      @user1 = user1
      @user2 = user2
    end

    def choose_follower_winner
      if @user1.followers > @user2.followers
        @user1.username #"#{user1.username} has more followers!"
      elsif @user2.followers > @user1.followers
        @user2.username #"#{user2.username} has more followers!"
      else 
        "It's a tie! Both #{user2.username} and #{user1.username} have the same number of followers!"
      end
    end

    def choose_following_winner
      if @user1.following > @user2.following
        @user1.username #"#{user1.username} has more followers!"
      elsif @user2.following > @user1.following
        @user2.username #"#{user2.username} has more followers!"
      else 
        "It's a tie! Both #{user2.username} and #{user1.username} are following the same number of users!"
      end
    end

    def choose_oldest_winner
      if @user1.created_at > @user2.created_at
        @user1.username #"#{user1.username} has more followers!"
      elsif @user2.created_at > @user1.created_at
        @user2.username #"#{user2.username} has more followers!"
      else 
        "It's a tie! Both #{user2.username} and #{user1.username} are the same age!"
      end
    end

    def most_recent_tweeter
      if @user1.last_tweet_time > @user2.last_tweet_time
        @user1 #"#{user1.username} has more followers!"
      else
        @user2
      end
    end
  end
end