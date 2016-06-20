class Tweet < ActiveRecord::Base
  belongs_to :customer, counter_cache: true

  def find_customer_code
     params = CGI.parse(URI.parse(expanded_url).query)
     params['code'].first
  end
end
