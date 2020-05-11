class CardNumber
  def initialize(entered_number)
    @array_elements = []
    @entered_number = entered_number
    @array_size = @entered_number.length
    @counter_calculations = 0
    @sum1 = 0
    @sum2 = 0
    @sum3 = 0
  end

  def valid?
    digits_array
    calculations_cycle
    calculations_result
    check_result
  end

  private

  def digits_array
    @digits_array ||= @entered_number.split(//).reverse.map(&:to_i)
  end

  def calculations_cycle
    @digits_array.each do
      calculations_paths
      @sum3 += @sum2.to_i
      @counter_calculations += 1
    end
  end

  def calculations_paths
    if (@counter_calculations % 2).odd?
      calculations_first_path
    elsif (@counter_calculations % 2).zero?
      calculations_secound_path
    end
  end

  def calculations_first_path
    @sum1 = 2 * @digits_array[@counter_calculations]
    if @sum1 >= 1
      calculations_first_case
    else
      calculations_secound_case
    end
  end

  def calculations_first_case
    first_digit = @sum1.to_s[0]
    secound_digit = @sum1.to_s[1]
    @sum2 = first_digit.to_i + secound_digit.to_i
  end

  def calculations_secound_case
    @sum2 = @sum1
  end

  def calculations_secound_path
    @sum2 = @digits_array[@counter_calculations]
  end

  def calculations_result
    sum = @sum3.to_i - @digits_array[0]
    @result = (sum * 9) % 10
  end

  def check_result
    (12..19).cover?(@array_size) && @digits_array[0] == @result
  end
end
account_number = ARGV.first
acc_number = CardNumber.new(account_number)
puts acc_number.valid?
