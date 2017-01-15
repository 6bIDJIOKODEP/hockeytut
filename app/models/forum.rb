class Forum < ApplicationRecord
	belongs_to :user
	has_many :forum_threads, dependent: :destroy
	has_many :forum_comments, dependent: :destroy
end
