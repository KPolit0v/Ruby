require_relative 'cardnumber'
account_number = ARGV.first
acc_number = CardNumber.new(account_number)
puts acc_number.valid?
