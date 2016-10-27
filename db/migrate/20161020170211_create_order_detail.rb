class CreateOrderDetail < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :part_number, index: true
      t.string :order_number, index: true
      t.float :amount
    end
  end
end
