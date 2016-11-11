class Document < ActiveRecord::Base 
  belongs_to :part, inverse_of: :documents
  has_attached_file :file
  do_not_validate_attachment_file_type :file

  validates :file, :description, presence: true
end
