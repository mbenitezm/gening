# == Schema Information
#
# Table name: orders
#
#  id                   :integer          not null, primary key
#  number               :string
#  customer_number      :string
#  order_date           :string
#  desired_ship_date    :string
#  last_ship_date       :string
#  promised_date        :string
#  total_amount_ordered :float
#  total_amount_shipped :float
#

class Order < ActiveRecord::Base 
  def to_date(str)
    Date.parse(str)
  end
end
