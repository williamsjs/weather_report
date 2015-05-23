require './alert.rb'
require './conditions.rb'
require './hurricane.rb'
require './location.rb'
require './sunrise_sunset.rb'
require './ten_day.rb'

puts "Enter a zipcode for your weather report: "

input = gets.chomp

input = zip.to_i

location = Location.new(zip)
alert = Alert.new(location)
conditions = Conditions.new(location)
hurricane = Hurricane.new(location)
sunrise_sunset = SunsetSunrise.new(location)
ten_day = TenDayForecast.new(location)
