require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
  class User
    def initialize(username)
      attr_reader :username
      @username = username
    end

    def followers
      client = Twitter::REST::Client.new do |config|
        config.consumer_key         = ENV["consumer_key"]
        config.consumer_secret      = ENV["consumer_secret"]
        config.access_token         = ENV["access_token"]
        config.access_token_secret  = ENV["access_token_secret"]
      end
    end
  end

  class Comparer
    def initialize(user1, user2)
      @user1 = user1
      @user2 = user2
    end
  end
end