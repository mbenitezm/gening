class Company < ActiveRecord::Base
  has_many :users, inverse_of: :company
  has_many :announcements, inverse_of: :company

  validates :name, presence: true
end
