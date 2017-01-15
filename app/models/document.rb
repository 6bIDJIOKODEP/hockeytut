class Document < ApplicationRecord
  belongs_to :tournament

  has_attached_file :paper
	do_not_validate_attachment_file_type :paper
end