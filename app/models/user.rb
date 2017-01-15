class User < ApplicationRecord
	validates :first_name, :last_name, presence: true, length: { maximum: 500 }
	has_many :tournaments, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :forums, dependent: :destroy
	has_many :forum_threads, dependent: :destroy
	has_many :forum_comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
