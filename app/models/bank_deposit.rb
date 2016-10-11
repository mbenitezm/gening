# == Schema Information
#
# Table name: bank_deposits
#
#  id           :integer          not null, primary key
#  bank_number  :string
#  description  :string
#  deposit_date :string
#  amout        :float
#

class BankDeposit < ActiveRecord::Base
end
