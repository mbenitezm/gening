class ReportsController < ApplicationController
  def product_statistics
  end

  def product_summary
    product_statistics = current_customer.product_info
    render json: { product_statistics: product_statistics}, status: 200
  end

  def purchase_orders
  end

  def deliveries
    @data = filter_customer(Order)
  end

  def invoices
    @data = filter_customer(Receivable)
  end

  def product_catalog
    @products = current_customer.product_info
  end

  def product_documents
    part = Part.find_by(description: params[:description])
    @documents = part.documents
  end
 
private
 
  def filter_customer(klass)
    return klass.all if current_user.admin?
    klass.where(customer_number: current_customer.number)
  end



  def product_information
  end
end
