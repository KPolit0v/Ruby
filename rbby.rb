




number = gets.chomp().to_i
numberstr = number.to_s

if numberstr.length().to_i > 19
 	return puts "The number has too many digits"
elsif numberstr.length().to_i < 13
	return puts "The number dont has enough digits"
end

a = 0
x = 0
i = 0
digits = Array.new
while a < numberstr.length()
 	digits[i] = numberstr[x]
	x += 1
	a += 1
	i += 1
end
digits = digits.reverse
print digits
a = 0
i = 0

sum3 = 0
while a < numberstr.length() 
		sum1 = 0
		sum2 = 0
		if a%2 == 1 
 			sum1 = 2*digits[i].to_i
 				if sum1 >= 10
 					m = sum1.to_s[0]
 					n = sum1.to_s[1] 
 					sum2 = m.to_i + n.to_i
 				else 
 					sum2 = sum1.to_i
 				end
 		else a%2 == 0
 			sum2 = digits[i]
		end
		sum3 += sum2.to_i
		a += 1
		i += 1
end

sum = sum3.to_i - digits[0].to_i 
end_result = (sum*9)%10


if end_result == digits[0].to_i
	print "The number is valid"
else
	print "The number is invalid"
end