# == Schema Information
#
# Table name: customers
#
#  id     :integer          not null, primary key
#  number :string
#  name   :string
#

class Customer < ActiveRecord::Base
  has_many :users, inverse_of: :customer
  has_many :announcements, inverse_of: :customer
end
