class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :user, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
