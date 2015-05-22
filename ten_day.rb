require 'httparty'

class TenDayForecast
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")["forecast"]["simpleforecast"]["forecastday"]
  end

  def forecast
    initial = "Your ten day forecast is: "
    10.times do |count|
      puts "\n#{weather[count]["date"]["month"]}/#{weather[count]["date"]["day"]}/#{weather[count]["date"]["year"]}"
      puts "\nTemperature: \n\thigh of #{weather[count]["high"]["fahrenheit"]}F, #{weather[count]["high"]["celsius"]}C"
      puts "\n\tLow of #{weather[count]["low"]["fahrenheit"]}F, #{weather[count]["low"]["celsius"]}"
    end
  end

end
