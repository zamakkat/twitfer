class RemoveTwitterUserFromCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :twitter_user_id, :string
    remove_column :customers, :twitter_user_handle, :string
  end
end
