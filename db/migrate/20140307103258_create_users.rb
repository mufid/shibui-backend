class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id:false do |t|
      t.string :id
      t.string :username
      t.string :consumer_key
      t.string :consumer_secret
      t.string :access_key
      t.string :access_secret
      t.integer :role
      t.timestamps
    end
  end

end
