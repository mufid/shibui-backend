class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :legislative_id
      t.string :tweet_id
      t.text :tweet

      t.timestamps
    end
  end
end
