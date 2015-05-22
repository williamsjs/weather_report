require 'httparty'

class Conditions
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")["current_observation"]
  end

  def fahrenheit
    weather["temp_f"]
  end

  def celsius
    weather["temp_c"]
  end

  def humidity
    weather["relative_humidity"]
  end

  def sky
    weather["weather"]
  end

end
