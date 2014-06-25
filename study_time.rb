array = ["8:30", "20:00", 120, 0]


def total_time_studied(array) 
	t_started = array[0].split(":")
	t_stopped = array[1].split(":")
	hours = t_stopped[0].to_i - t_started[0].to_i
	min = t_stopped[1].to_i - t_started[1].to_i - array[2] + array[3]
	
	if min < 0
		if min % 60 == 0
			puts min / 60
		elsif min % 60 != 0 
			puts min % 60
		end
				


	elsif min > 60
		puts ">60"
	else
		puts "between"
	end

	puts "You've been working #{hours} hours and #{min} minutes"
end

total_time_studied(array)