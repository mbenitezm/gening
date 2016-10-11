# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Company < ActiveRecord::Base
  has_many :users, inverse_of: :company
  has_many :announcements, inverse_of: :company

  validates :name, presence: true
end
