FactoryGirl.define do
  factory :tweet do
    tweet_id Faker::Number.number(15)
    text Faker::Lorem.sentences(3)
    # twitter_user_id Faker::Number.number(16)
    # twitter_user_handle Faker::Internet.user_name(separators: [])
  end
end
