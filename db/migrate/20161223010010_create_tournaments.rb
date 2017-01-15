class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :tournament_type
      t.string :category
      t.integer :teams_qty
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.string :currency
      t.integer :team_price
      t.integer :player_price
      t.text :description
      t.boolean :inhabitancy
      t.boolean :food
      t.boolean :transfer
      t.boolean :entertainment
      t.boolean :others
      t.string :phone_number
      t.string :contact_email
      t.string :club
      t.string :website
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
