# == Schema Information
#
# Table name: order_details
#
#  id           :integer          not null, primary key
#  part_number  :string
#  order_number :string
#  amount       :float
#
class OrderDetail < ActiveRecord::Base
  def parts
    where(number: part_number)
  end

  def to_date(str)
    Date.parse(str)
  end
end
