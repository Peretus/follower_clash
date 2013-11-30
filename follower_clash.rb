require 'rubygems'
require 'bundler/setup'
$LOAD_PATH << '.'
require "lib/user_comparer.rb"

user1 = UserComparer::User.new("caseymcneil")
user2 = UserComparer::User.new("techpeace")

puts "#{user1.username}'s follower count is: #{user1.followers}"
puts "#{user2.username}'s follower count is: #{user2.followers}"

my_comparer = UserComparer::Comparer.new(user1, user2)
puts "#{my_comparer.choose_follower_winner.capitalize} has more followers!"
puts "#{my_comparer.choose_oldest_winner.capitalize} is older!"
puts "#{my_comparer.choose_following_winner.capitalize} is following more!"
puts "The most recent tweet was from #{my_comparer.most_recent_tweeter.username.capitalize}:\n\n\n"
puts "#{my_comparer.most_recent_tweeter.last_tweet.capitalize}"


