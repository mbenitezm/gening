class AddProductDescriptionToProductStatistics < ActiveRecord::Migration
  def change
    add_column :product_statistics, :part_description, :string
  end
end
