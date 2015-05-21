require 'httparty'

class Conditions
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

  def fahrenheit
    weather["current_observation"]["temp_f"]
  end

  def celsius
    weather["current_observation"]["temp_c"]
  end

  def humidity
    weather["current_observation"]["relative_humidity"]
  end

end
