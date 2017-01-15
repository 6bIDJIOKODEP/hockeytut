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

	def update_without_password(params, *options)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
end
