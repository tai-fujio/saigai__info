class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :good, default: 0
      t.integer :bad, default: 0
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
