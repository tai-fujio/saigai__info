class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :title
      t.references :map, foreign_key: true

      t.timestamps
    end
    add_index  :sites, [:latitude,:longitude], unique: true
  end
end
