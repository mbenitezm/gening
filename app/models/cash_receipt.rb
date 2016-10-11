# == Schema Information
#
# Table name: cash_receipts
#
#  id              :integer          not null, primary key
#  customer_number :string
#  amount          :float
#  check_date      :string
#  created_date    :string
#  deposit_id      :integer
#

class CashReceipt < ActiveRecord::Base
end
