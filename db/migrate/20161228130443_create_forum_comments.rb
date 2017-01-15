class CreateForumComments < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :forum, foreign_key: true      
      t.references :forum_thread, foreign_key: true

      t.timestamps
    end
  end
end
