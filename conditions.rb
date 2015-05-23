require 'httparty'

class Conditions
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = get_weather
  end

  def fahrenheit
    "fahrenheit: #{weather["temp_f"]}"
  end

  def celsius
    "celsius: weather["temp_c"]"
  end

  def humidity
    "humidity: weather["relative_humidity"]"
  end

  def sky
    "sky: weather["weather"]"
  end

  private def get_weather
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")["current_observation"]
  end

end
