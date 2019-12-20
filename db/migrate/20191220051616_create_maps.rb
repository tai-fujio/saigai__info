class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :name, null: false, unique: true
      t.string :password_digest, null: false
      t.string :creater

      t.timestamps
    end
  end
end
