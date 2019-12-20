class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :name
      t.string :password
      t.string :creater

      t.timestamps
    end
  end
end
