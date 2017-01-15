class Tournament < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :photos, dependent: :destroy
  
  validates :tournament_type, :name, :address, :start_date, :end_date, :phone_number, :contact_email, presence: true

	validates :category, presence: true, unless: ->(tournament){tournament.category_camp.present?}
	validates :category_camp, presence: true, unless: ->(tournament){tournament.category.present?}

  geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

end
