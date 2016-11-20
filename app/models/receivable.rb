# == Schema Information
#
# Table name: receivables
#
#  id                      :integer          not null, primary key
#  invoice_id              :string
#  customer_number         :string
#  invoice_date            :string
#  total_amount_receivable :float
#  paid_amount             :float
#  terms_description       :string
#

class Receivable < ActiveRecord::Base
  def to_date(str)
    Date.parse(str)
  end
end
