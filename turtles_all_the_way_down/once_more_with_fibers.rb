require 'twitter'
require './constants'
require './client'

client = Saga::Client.create

twitter_stream = Fiber.new do
  client.filter(track: Saga::TOPICS.join(',')) do |object|
    Fiber.yield object
  end
end

tweet_filter = Fiber.new do
  while object = twitter_stream.resume
    Fiber.yield object.text if object.is_a?(Twitter::Tweet)
  end
end

keyword_emphasizer = Fiber.new do
  while tweet = tweet_filter.resume do
    Fiber.yield tweet.gsub(/([\#\@]?#{Saga::TOPICS.first})/i, '**\1**')
  end
end

header_prepender = Fiber.new do
  while tweet = keyword_emphasizer.resume do
    Fiber.yield "TURTLES!!!1: #{tweet}"
  end
end

delimiter = Fiber.new do
  while tweet = header_prepender.resume do
    Fiber.yield "#{tweet}\n-----"
  end
end

while tweet = delimiter.resume do
  puts tweet
end
