

account_number = ARGV.first
digits = []
max_size = account_number.length().to_i

class Card_number
  def set_number(array_elements, entered_number, array_size)
    @array_elements = array_elements
    @entered_number = entered_number
    @array_size = array_size
    @counter_array = 0
    @counter_calculations = 0
    @sum1 = 0
    @sum2 = 0
    @sum3 = 0
  end

  def number_check
    get_array
    reverse_array
    calculations
    result1
    check_result
  end

  def get_array
    @array_elements[@array_size - 1] = 1
    @array_elements.each do |digit|
    @array_elements[@counter_array] = @entered_number[@counter_array]
    @counter_array += 1 
    end
  end

  def reverse_array
    @array_elements = @array_elements.reverse
  end

  def calculations
    @array_elements.each do |digit|
    calculations1
    @sum3 += @sum2.to_i
    @counter_calculations += 1
    end
  end

  def calculations1
    if @counter_calculations%2 == 1
      calculations2
    else @counter_calculations%2 == 0
      calculations3
    end
  end

  def calculations2
    @sum1 = 2*@array_elements[@counter_calculations].to_i
    if @sum1 >= 1
      calculations21
    else 
      calculations22
    end
  end

  def calculations21
    first_digit = @sum1.to_s[0]
    secound_digit = @sum1.to_s[1]
    @sum2 = first_digit.to_i + secound_digit.to_i
  end

  def calculations22
    @sum2 = @sum1
  end

  def calculations3
    @sum2 = @array_elements[@counter_calculations]
  end
      

  def result1
    sum = @sum3.to_i - @array_elements[0].to_i 
    return @result = (sum*9)%10
  end 

  def check_result
    (12..18).cover?(@array_size) && @array_elements[0].to_i == @result 
  end
end

generate_number = Card_number.new
generate_number.set_number(digits, account_number, max_size)
result = generate_number.number_check
puts result
