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

  def product_info(user)
    return admin_product_info if user.admin?
    normal_product_info unless user.admin?
  end

  def dates_info(user)
    orders = Order.where(customer_number: number) unless user.admin?
    orders = Order.all if user.admin?
    orders.where.not(promised_date: nil).where.not(last_ship_date: nil)
  end

  private
  def admin_product_info
    ProductStatistic.connection.select_all(
      "SELECT part_description, SUM(amount)
      FROM product_statistics
      GROUP BY part_description"
    ).rows
  end

  def normal_product_info
    ProductStatistic.connection.select_all(
      "SELECT part_description, SUM(amount)
      FROM product_statistics
      WHERE customer_id = #{id}
      GROUP BY part_description"
    ).rows
  end
end
