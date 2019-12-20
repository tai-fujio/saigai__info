class CreateKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :keys do |t|
      t.string :value, null:false, unique: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
