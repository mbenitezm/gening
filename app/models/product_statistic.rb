# == Schema Information
#
# Table name: product_statistics
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  part        :string
#  amount      :float
#

class ProductStatistic < ActiveRecord::Base
  belongs_to :customer, inverse_of: :product_statistics
end
