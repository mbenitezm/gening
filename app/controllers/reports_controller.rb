class ReportsController < ApplicationController
  def product_statistics
    @order_details = current_customer.product_statistics
  end

  def purchase_orders
  end

  def deliveries
    @data = filter_customer(Order)
  end

  def invoices
    @data = filter_customer(Receivable)
  end
 
private
 
  def filter_customer(klass)
    return klass.all if current_user.admin?
    klass.where(customer_number: current_customer.number)
  end



  def product_information
  end
end
