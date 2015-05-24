require './alert.rb'
require './conditions.rb'
require './hurricane.rb'
require './location.rb'
require './sunrise_sunset.rb'
require './ten_day.rb'

puts "Enter a zipcode or city, state for your weather report: "

input = gets.chomp

location = Location.new(input)
alert = Alert.new(location)
conditions = Conditions.new(location)
hurricane = Hurricane.new
sunrise_sunset = SunriseSunset.new(location)
ten_day = TenDayForecast.new(location)

puts conditions.fahrenheit
puts conditions.celsius
puts conditions.humidity
puts conditions.sky
puts hurricane.list
puts sunrise_sunset.sunrise
puts sunrise_sunset.sunset
puts ten_day.ten_day
puts alert.alert_message
