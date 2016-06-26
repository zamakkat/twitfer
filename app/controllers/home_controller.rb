class HomeController < ApplicationController
  def index
    @customers_count = Customer.count
    @tweets_count = Tweet.count
  end
end
