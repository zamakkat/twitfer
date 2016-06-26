class HomeController < ApplicationController
  def index
    @customers_count = Customer.count
    @tweets_count = Tweet.count
    @plot_data = Tweet.where('created_at > ?', 30.days.ago).group('DATE(created_at)').count.collect { |date, count| { date: date, tweets: count } }.to_json
  end
end
