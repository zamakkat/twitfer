class Tweet < ActiveRecord::Base
  belongs_to :customer, counter_cache: true
end
