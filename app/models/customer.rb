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

  def receivables
    Receivable.where(customer_number: number)
  end

  def cash_receipts
    CashReceipt.where(customer_number: number)
  end

  def orders
    Order.where(customer_number: number)
  end

  def order_details
    orders = current_customer.orders
    details_for_orders(orders)
  end

  def to_date(str)
    Date.parse(str)
  end

  private
  def details_for_orders
    order_details_all = OrderDetail.select(
      :all,
      select: "part_number, order_number, sum(order_details_all.amount)",
      group: "part_number, order_number"
    )
    order_details = []
    orders.each do |order|
      od = order_details_all.where(order_number: order.number)
      order_details << od if od
    end
    order_details
  end
end
