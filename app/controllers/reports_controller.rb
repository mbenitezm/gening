class ReportsController < ApplicationController
  def product_statistics
  end

  def purchase_orders
  end

  def deliveries
    @data = filter_customer(Order)
  end
 
private
 
  def filter_customer(klass)
    return klass.all if current_user.admin?
    klass.where(customer_number: current_customer.number)
  end

  def invoices
  end

  def product_information
  end
end
