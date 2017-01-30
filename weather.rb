#Add barometer gem
require 'barometer'

#Get location input from user
puts "Please enter location: "
location = gets.chomp
puts "	Fetching weather..."

#Fetches weather using Barometer gem
barometer = Barometer.new(location)
weather = barometer.measure
current_condition = weather.current.condition
current_condition = current_condition.downcase

#Sets tomorrow
tomorrow = Time.now.strftime('%d').to_i + 1

#Current weather
puts "	Current weather in #{location} is #{current_condition}."

#Loop through each forecast day
weather.forecast.each do |forecast|
	day = forecast.starts_at.day

	if day == tomorrow
		day_name = 'Tomorrow'
	else
		day_name = forecast.starts_at.strftime('%a')
	end


	puts "#{day_name} : 
	The weather should be #{forecast.icon} with a high of 
	#{forecast.high.f} and low of #{forecast.low.f}."
end