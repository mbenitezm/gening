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

  def date_statistics
    countOnTime = 1
    countDelayed = 0


    render json: { onTime: countOnTime, delayed: countDelayed}, status:200
  end
 
private
 
  def filter_customer(klass)
    return klass.all.paginate(page: params[:page], per_page:50) if current_user.admin?
    klass.where(customer_number: current_user.customer.number)
  end



  def product_information
  end
end
