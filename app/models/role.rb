# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#

class Role < ActiveRecord::Base
  acts_as_paranoid

  has_many :users, inverse_of: :role

  validates :name, presence: true
end
