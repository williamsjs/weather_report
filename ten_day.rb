require 'httparty'

class TenDayForecast
  attr_reader :zip, :weather, :forecast

  def initialize(location)
    @zip = location.zip
    @weather = get_weather
    @forecast = []
  end

  def get_forecast
    initial = "Your ten day forecast is: "
    @forecast = get_weather.map do |item|
      "\n#{item["date"]["month"]}/#{item["date"]["day"]}/#{item["date"]["year"]}"
      "\nTemperature: \n\thigh of #{item["high"]["fahrenheit"]}F, #{item["high"]["celsius"]}C"
      "\n\tLow of #{item["low"]["fahrenheit"]}F, #{item["low"]["celsius"]}"
    end
  end

  private def get_weather
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")["forecast"]["simpleforecast"]["forecastday"]
  end

end
