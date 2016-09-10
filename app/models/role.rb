class Role < ActiveRecord::Base
  acts_as_paranoid

  has_many :users, inverse_of: :role

  validates :name, presence: true
end
