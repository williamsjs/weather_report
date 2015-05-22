require 'httparty'

class Alert
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
    @alerts = []
  end

  def alert_message
    alert_message = ''
    if weather["alerts"].empty?
      @alerts = "There are no weather alerts for your area"
    else
      @alerts = weather["alerts"].map do |item|
        "Description: #{item["description"]} \nMessage: #{item["message"]}"
      end
    end
  end

end
