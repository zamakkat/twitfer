class TwitterStreamWorker
  include Sidekiq::Worker
  sidekiq_options unique: :until_and_while_executing

  def perform
    fail 'Twitter environment variables missing' if ENV['TWITTER_CONSUMER_KEY'].blank? || ENV['TWITTER_CONSUMER_SECRET'].blank? || ENV['TWITTER_ACCESS_TOKEN'].blank? || ENV['TWITTER_ACCESS_TOKEN_SECRET'].blank?
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end

    client.filter(track: 'twitfer production code') do |object|
      if object.is_a?(Twitter::Tweet)
        # Make sure that the tweet has not been indexed
        return if Tweet.find_by(tweet_id: object.id)
        tweet = Tweet.new(
          tweet_id: object.id,
          text: object.text,
          expanded_url: object.uris.first.expanded_url,
          twitter_user_id: object.user.id,
          twitter_user_handle: object.user.screen_name,
          created_at: object.created_at
        )
        customer_code = tweet.find_customer_code
        if customer_code
          customer = Customer.find_or_create_by(code: customer_code)
          tweet.customer = customer
          tweet.save
        end
      end
    end
  rescue Twitter::Error::TooManyRequests => error
    Rails.logger.warn "Twitter rate limited. Time to retry: #{(error.rate_limit.reset_in || 0) + 1}"
    sleep (error.rate_limit.reset_in || 0) + 1
    retry
  end
end
