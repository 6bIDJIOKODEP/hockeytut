class AddCategoryCampToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :category_camp, :string
  end
end
