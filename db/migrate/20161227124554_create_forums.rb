class CreateForums < ActiveRecord::Migration[5.0]
  def change
    create_table :forums do |t|
      t.string :main_branch
      t.string :main_branch_short_info
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
