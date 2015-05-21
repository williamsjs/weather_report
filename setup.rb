require 'httparty'

weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/CA/San_Francisco.json")
