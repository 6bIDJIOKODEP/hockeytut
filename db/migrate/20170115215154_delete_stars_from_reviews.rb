class DeleteStarsFromReviews < ActiveRecord::Migration[5.0]
  def change
  	remove_column :reviews, :star
  end
end
