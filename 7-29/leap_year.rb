year = ARGV.first.to_i

puts "You input: #{year}"

def divisible? year, num
  year%num == 0
end

	if divisible? year, 4
		if divisible? year, 400
      puts "#{year} is a leap year!"
			true
		elsif divisible? year, 100
      puts "#{year} is not a leap year!"
			false
		else
      puts "#{year} is a leap year!"
			true
		end
	else
    puts "#{year} is not a leap year!"
		false
	end
