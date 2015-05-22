require 'httparty'

class Hurricane
  attr_reader :zip, :weather, :hurricanes, :list

  def initialize(location)
    @zip = location.zip
    @weather = get_weather
  end

  def list
    list = weather.map do |h|
      h["c"]
    end
  end

  private def get_weather
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")["current_hurricane"]
  end


end
