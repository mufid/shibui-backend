class CreateDistricts < ActiveRecord::Migration
  def up
    create_table :districts, id:false do |t|
      t.string :id
      t.string :name
      t.string :full_name
      t.integer :id_api
      t.timestamps
    end
    execute "ALTER TABLE districts ADD PRIMARY KEY (id);"
  end

  def drop
    drop_table :districts
  end
end
