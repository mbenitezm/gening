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
  has_many :product_statistics, inverse_of: :customer

  def receivables
    Receivable.where(customer_number: number)
  end

  def cash_receipts
    CashReceipt.where(customer_number: number)
  end

  def orders
    Order.where(customer_number: number)
  end

  def to_date(str)
    Date.parse(str)
  end

  def product_info
    ProductStatistic.connection.select_all(
      "SELECT part_description, SUM(amount)
      FROM product_statistics
      WHERE customer_id = #{id}
      GROUP BY part_description"
    ).rows
  end

  def dates_info
    Order.where(customer_number: number).where.not(promised_date: nil)
  end
end
