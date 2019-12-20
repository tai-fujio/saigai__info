class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
