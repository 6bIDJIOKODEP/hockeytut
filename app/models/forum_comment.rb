class ForumComment < ApplicationRecord
  belongs_to :user
  belongs_to :forum_thread
  belongs_to :forum
end
