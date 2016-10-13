# == Schema Information
#
# Table name: bank_accounts
#
#  id          :integer          not null, primary key
#  number      :string
#  description :string
#  gl_acccount :string
#  bank_name   :string
#

class BankAccount < ActiveRecord::Base
end
