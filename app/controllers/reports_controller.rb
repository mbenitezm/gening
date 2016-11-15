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

  def invoices_json
    invoices_json = filter_customer(Receivable)
    render json: { invoices_json: invoices_json }, status: 200
  end

  def date_statistics
    countOnTime = 0
    countDelayed = 0
    date_statistics = current_customer.dates_info
    for i in date_statistics
      if i.to_date(i.promised_date) < i.to_date(i.last_ship_date)
        countDelayed += 1
      else
        countOnTime += 1
      end
    end
    render json: { onTime: countOnTime, delayed: countDelayed}, status:200
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
    return klass.all.paginate(page: params[:page], per_page:50) if current_user.admin?
    klass.where(customer_number: current_user.customer.number)
  end

  def filter_customerJSON(klass)
    return klass.all if current_user.admin?
    klass.where(customer_number: current_customer.number)
  end

  def product_information
  end
end
