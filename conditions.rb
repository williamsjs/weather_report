require 'httparty'

class Conditions
  attr_reader :zip

  def initialize(location)
    @zip = location.zip
  end

  def fahrenheit
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
    weather["current_observation"]["temp_f"]
  end

  def celsius
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
    weather["current_observation"]["temp_c"]
  end

end
