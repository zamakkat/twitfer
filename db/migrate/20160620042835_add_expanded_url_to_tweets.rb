class AddExpandedUrlToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :expanded_url, :string
  end
end
