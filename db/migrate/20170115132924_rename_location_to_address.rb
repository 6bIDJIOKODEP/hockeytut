class RenameLocationToAddress < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tournaments, :location, :address
  end
end
