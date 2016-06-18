class TwitterStreamWorker
  include Sidekiq::Worker

  def perform
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end

    client.filter(track: 'twitfer production') do |object|
      if object.is_a?(Twitter::Tweet)
        puts object.id
        puts object.text
        puts object.uri
      end
    end
  end
end
