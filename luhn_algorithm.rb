
account_number = ARGV.first
digits = []
max_size = account_number.length().to_i

class Card_number
  def set_number(array_elements, entered_number, array_size)
    @array_elements = array_elements
    @entered_number = entered_number
    @array_size = array_size
  end

  def get_array
  @array_elements[@array_size] = 1
  counter = 0
    @array_elements.each do |digit|
    @array_elements[counter] = @entered_number[counter]
    counter += 1
    end
  @array_elements = @array_elements.reverse
  end

  def calculations
    string_counter = 0
	array_counter = 0
	sum3 = 0
	@array_elements.slice!(0)
	  @array_elements.each do |digit|
   	  sum1 = 0
   	  sum2 = 0
   	  if string_counter%2 == 1 
        sum1 = 2*@array_elements[array_counter].to_i
 	 	if sum1 >= 10
 	  	 first_digit = sum1.to_s[0]
 	  	 secound_digit = sum1.to_s[1] 
 	  	 sum2 = first_digit.to_i + secound_digit.to_i
 		else 
 		 sum2 = sum1.to_i
 	 	end
   	  else string_counter%2 == 0
        sum2 = @array_elements[array_counter]
   	  end
   	  sum3 += sum2.to_i
   	  string_counter += 1
   	  array_counter += 1
      end
	sum = sum3.to_i - @array_elements[0].to_i 
	return @result = (sum*9)%10
  end

  def check_result
    (12..18).cover?(@array_size) && @array_elements[0].to_i == @result 
  end
end

generate_number = Card_number.new
generate_number.set_number(digits, account_number, max_size)
digits = generate_number.get_array
result = generate_number.calculations
check = generate_number.check_result
puts check
