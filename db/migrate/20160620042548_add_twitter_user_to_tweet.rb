class AddTwitterUserToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :twitter_user_id, :string
    add_column :tweets, :twitter_user_handle, :string
  end
end
