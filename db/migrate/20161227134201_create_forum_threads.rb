class CreateForumThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_threads do |t|
      t.string :subject
      t.text :main_discussion_text
      t.references :forum, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
