class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :customer, index: true, foreign_key: true
      t.string :tweet_id
      t.text :text

      t.timestamps null: false
    end
  end
end
