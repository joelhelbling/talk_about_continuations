require 'twitter'
require 'shifty'
require './constants'
require './client'

include Shifty::DSL

client = Saga::Client.create

twitter_stream = source_worker do
  client.filter(track: Saga::TOPICS.join(',')) do |object|
    handoff object
  end
end

tweet_filter = filter_worker do |object|
  object.is_a? Twitter::Tweet
end

tweet_extracter = relay_worker do |object|
  object.text
end

keyword_emphasizer = relay_worker do |tweet|
  tweet.gsub(/([\#\@]?#{Saga::TOPICS.first})/i, '**\1**')
end

header_prepender = relay_worker do |tweet|
  "TURTLES!!!1: #{tweet}"
end

delimiter = relay_worker do |tweet|
  "#{tweet}\n-----"
end

turtle_news_pipeline =
  twitter_stream     |
  tweet_filter       |
  tweet_extracter    |
  keyword_emphasizer |
  header_prepender   |
  delimiter

while true do
  puts turtle_news_pipeline.shift
end
