require 'twitter'
require './constants'
require './client'

client = Saga::Client.create

client.filter(track: Saga::TOPICS.join(',')) do |object|
  if object.is_a? Twitter::Tweet
    object.text.tap do |tweet|
      tweet = tweet.gsub(/([\#\@]?#{Saga::TOPICS.first})/i, '**\1**')

      puts <<~TWEET
      TURTLES!!!1: #{tweet}
      -----
      TWEET
    end
  end
end
