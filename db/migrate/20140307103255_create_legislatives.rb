class CreateLegislatives < ActiveRecord::Migration
  def change
    create_table :legislatives do |t|
      t.string :name
      t.integer :id_api
      t.string :party_id
      t.string :district_id
      t.text :dump

      t.timestamps
    end
  end
end
