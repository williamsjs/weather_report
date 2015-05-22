require 'httparty'

class TenDayForecast
  attr_reader :zip, :weather, :ten_day

  def initialize(location)
    @zip = location.zip
    @weather = get_weather
    @ten_day = "Your ten day forecast is: \n\n#{get_forecast}"
  end

  private def get_forecast
    all = get_weather.map do |item|
      """#{item["date"]["month"]}/#{item["date"]["day"]}/#{item["date"]["year"]}
      \thigh of #{item["high"]["fahrenheit"]}F, #{item["high"]["celsius"]}C
      \tLow of #{item["low"]["fahrenheit"]}F, #{item["low"]["celsius"]}C\n"""
    end
    all.join
  end

  private def get_weather
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")["forecast"]["simpleforecast"]["forecastday"]
  end

end
