namespace :statistics do

  desc "product statistics"
  task :products => :environment do
    Customer.all.each do |customer|
      order_details(customer)
    end
    puts "done"
  end

  def order_details(customer)
    orders = customer.orders
    details_for_orders(orders, customer)
  end

  def details_for_orders(orders, customer)
    order_details_all = OrderDetail.connection.select_all("
      SELECT order_number, part_number, SUM(amount)
      FROM order_details
      GROUP BY order_number, part_number
    ").rows 
    orders.each do |order|
      order_details = order_details_all.select { |od| od[0] == order.number && od[1] }
      create_product_statistics(order_details, customer)
    end
  end

  def create_product_statistics(order_details, customer)
    order_details.each do |od|
        ProductStatistic.create(customer_id: customer.id, part_number: od[1],
                              amount: od[2], part_description: Part.find_by(number: od[1]).description)
    end
  end
end