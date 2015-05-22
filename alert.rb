require 'httparty'

class Alert
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

  def alert_message
    if weather["alerts"].empty?
      "There are no weather alerts for your area"
    else
      weather["alerts"][0]["description"]
      weather["alerts"][0]["message"]
    end
  end

end
