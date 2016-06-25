class HomeController < ApplicationController
  def index
  end

  def customers
    @customers = Customer.all
    @tweets = Tweet.all
  end
end
