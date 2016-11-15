class CreateProductStatistics < ActiveRecord::Migration
  def change
    create_table :product_statistics do |t|
      t.integer :customer_id, index: true
      t.string :part_number, index: true
      t.float :amount
    end
  end
end
