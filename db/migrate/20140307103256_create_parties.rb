class CreateParties < ActiveRecord::Migration
  def up
    create_table :parties, id:false, primary_key: :id do |t|
      t.integer :id
      t.string :name
      t.string :full_name
      t.integer :id_api
      t.timestamps
    end
    execute "ALTER TABLE parties ADD PRIMARY KEY (id);"
  end
  def down
    drop_table :parties
  end
end
