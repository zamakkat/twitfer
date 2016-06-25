class AddTwitterUserToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :twitter_user_id, :string
    add_column :customers, :twitter_user_handle, :string
  end
end
