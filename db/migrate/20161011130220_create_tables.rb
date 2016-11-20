class CreateTables < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string  :number
      t.string  :description 
    end

    create_table :bank_accounts do |t|
      t.string  :number
      t.string  :description
      t.string  :gl_acccount
      t.string  :bank_name
    end

    create_table :bank_deposits do |t|
      t.string  :bank_number, index: true
      t.string  :description
      t.string  :deposit_date
      t.float   :amout
    end

    create_table :cash_receipts do |t|
      t.string  :customer_number, index: true
      t.float   :amount
      t.string  :check_date
      t.string  :created_date
      t.integer :deposit_id
    end

    create_table :customers do |t|
      t.string  :number
      t.string  :name
    end

    create_table :orders do |t|
      t.string  :number
      t.string  :customer_number, index: true
      t.string  :order_date
      t.string  :desired_ship_date
      t.string  :last_ship_date
      t.string  :promised_date
      t.float   :total_amount_ordered
      t.float   :total_amount_shipped
    end

    create_table :parts do |t|
      t.string  :number
      t.string  :description
      t.string  :part_type
      t.float   :weight
    end

    create_table :receivables do |t|
      t.string  :invoice_id
      t.string  :customer_number, index: true
      t.string  :invoice_date
      t.float   :total_amount_receivable
      t.float   :paid_amount
      t.string  :terms_description
    end
  end
end
