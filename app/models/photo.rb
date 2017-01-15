class Photo < ApplicationRecord
  belongs_to :tournament

  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>"}
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/, /JPE?G\z/]
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/png", "image/JPG"] }
  
end
