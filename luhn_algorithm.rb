account_number = ARGV.first

class Card_number
  def initialize(entered_number)
    @array_elements = []
    @entered_number = entered_number
    @counter_array = 0
    @array_size = @entered_number.length
    @counter_calculations = 0
    @sum1 = 0
    @sum2 = 0
    @sum3 = 0
  end

  def valid?
    digits_array
    calculations
    calculations_result
    check_result
  end

  private

  def digits_array
    @array_elements = @entered_number.split(//)
    @array_elements = @array_elements.reverse
  end

  def calculations
    @array_elements.each do
      calculations_one
      @sum3 += @sum2.to_i
      @counter_calculations += 1
    end
  end

  def calculations_one
    if (@counter_calculations % 2).odd?
      calculations_two
    elsif (@counter_calculations % 2).zero?
      calculations_five
    end
  end

  def calculations_two
    @sum1 = 2 * @array_elements[@counter_calculations].to_i
    if @sum1 >= 1
      calculations_three
    else
      calculations_four
    end
  end

  def calculations_three
    first_digit = @sum1.to_s[0]
    secound_digit = @sum1.to_s[1]
    @sum2 = first_digit.to_i + secound_digit.to_i
  end

  def calculations_four
    @sum2 = @sum1
  end

  def calculations_five
    @sum2 = @array_elements[@counter_calculations]
  end

  def calculations_result
    sum = @sum3.to_i - @array_elements[0].to_i
    @result = (sum * 9) % 10
  end

  def check_result
    (12..18).cover?(@array_size) && @array_elements[0].to_i == @result
  end
end

acc_number = Card_number.new(account_number)
puts acc_number.valid?
