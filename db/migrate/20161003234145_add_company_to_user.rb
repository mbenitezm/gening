class AddCompanyToUser < ActiveRecord::Migration
  def change
    add_column :users, :company_id, :integer, index: true
  end
end
