class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :code
      t.integer :tweets_count

      t.timestamps null: false
    end
  end
end
