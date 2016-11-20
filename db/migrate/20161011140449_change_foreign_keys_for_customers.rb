class ChangeForeignKeysForCustomers < ActiveRecord::Migration
  def change
    rename_column :announcements, :company_id, :customer_id
    rename_column :users, :company_id, :customer_id
  end
end
