class ForumThread < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :forum_comments, dependent: :destroy
end
