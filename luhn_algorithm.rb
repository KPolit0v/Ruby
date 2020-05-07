
account_number = ARGV.first
digits = []
max_size = account_number.length().to_i
digits_reversed = []

def get_digits(array_elements, entered_number, array_size)
array_elements[array_size] = 1
string_counter = 0
array_counter = 0
  array_elements.each do |digit|
    array_elements[array_counter] = entered_number[string_counter]
    string_counter += 1
    array_counter += 1
  end    
end
get_digits(digits, account_number, max_size)
digits = digits.reverse
digits.delete_at(0)
string_counter = 0
array_counter = 0
sum3 = 0
digits.each do |digit|
  sum1 = 0
  sum2 = 0
  if string_counter%2 == 1 
    sum1 = 2*digits[array_counter].to_i
 	if sum1 >= 10
 	  first_digit = sum1.to_s[0]
 	  secound_digit = sum1.to_s[1] 
 	  sum2 = first_digit.to_i + secound_digit.to_i
 	else 
 	  sum2 = sum1.to_i
 	end
  else string_counter%2 == 0
    sum2 = digits[array_counter]
  end
  sum3 += sum2.to_i
  string_counter += 1
  array_counter += 1
end

sum = sum3.to_i - digits[0].to_i 
end_result = (sum *9)%10

def check_result(result, last_digit, size)
  (12..18).cover?(size) && last_digit.to_i == result 
end
puts check_result(end_result, digits[0], max_size)