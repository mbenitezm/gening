require 'csv'
namespace :db do

  desc "Populate DB from CSV to Models"
  task :populate => :environment do
    #Account
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_ACCOUNT.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      Account.create(number: row['ID'], description: row['DESCRIPTION'])
    end

    puts "account good"

    #BankAccount
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_BANK_ACCOUNT.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      BankAccount.create(number: row['ID'], description: row['DESCRIPTION'], gl_acccount: row['GL_ACCOUNT_ID'], bank_name: row['BANK_NAME'])
    end

    puts "banckaccount good"

    #BankDeposit
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_BANK_DEPOSIT.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      BankDeposit.create(bank_number: row['BANK_ACCOUNT_ID'], description: row['DESCRIPTION'], deposit_date: row['DEPOSIT_DATE'], amout: row['AMOUNT'])
    end

    puts "bank deposit good"

    #CashReceipt
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_CASH_RECEIPT.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      CashReceipt.create(customer_number: row['CUSTOMER_ID'], amount: row['AMOUNT'], check_date: row['CHECK_DATE'], created_date: row['CREATE_DATE'], deposit_id: row['DEPOSIT_ID'])
    end

    puts "cash receipt good"

    #Customer
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_CUSTOMER.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      Customer.create(number: row['ID'], name: row['NAME'])
    end

    puts "customer good"

    #Order
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_CUSTOMER_ORDER.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      Order.create(number: row['ID'], customer_number: row['CUSTOMER_ID'], order_date: row['ORDER_DATE'], desired_ship_date: row['DESIRED_SHIP_DATE'], last_ship_date: row['LAST_SHIPPED_DATE'], promised_date: row['PROMISE_DATE'], total_amount_ordered: row['TOTAL_AMT_ORDERED'], total_amount_shipped: row['TOTAL_AMT_SHIPPED'])
    end

    puts "order good"

    #Part
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_PART.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      Part.create(number: row['ID'], description: row['DESCRIPTION'], part_type: row['PRODUCT_CODE'], weight: row['WEIGHT'])
    end

    puts "part good"

    #Receivable
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_RECEIVABLE.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      Receivable.create(invoice_id: row['INVOICE_ID'], customer_number: row['CUSTOMER_ID'], invoice_date: row['INVOICE_DATE'], total_amount_receivable: row['TOTAL_AMOUNT'], paid_amount: row['PAID_AMOUNT'], terms_description: row['TERMS_DESCRIPTION'])
    end

    puts "receivable good"

    #OrderDetails
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_CUST_ORDER_LINE.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      OrderDetail.create(part_number: row['PART_ID'], order_number: row['CUST_ORDER_ID'], amount: row['ORDER_QTY'])
    end

    puts "OrderDetail good"



  end
  desc "Populate DB from CSV to Models"
  task :orderdetail => :environment do
    #OrderDetails
    CSV.foreach("#{Rails.root}/lib/csv/PUBLIC_CUST_ORDER_LINE.csv", :encoding => 'windows-1251:utf-8', :headers => true ) do |row|
      OrderDetail.create(part_number: row['PART_ID'], order_number: row['CUST_ORDER_ID'], amount: row['ORDER_QTY'])
    end

    puts "OrderDetail good"
  end
end