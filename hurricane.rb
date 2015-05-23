require 'httparty'

class Hurricane
  attr_reader :zip, :weather, :hurricanes, :list

  def initialize(location)
    @zip = location.zip
    @weather = get_weather
    @list = []
  end

  def list
    list = weather.map do |h|
      h["stormInfo"]["stormName"]
    end
  end

  private def get_weather
    HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")["currenthurricane"]
  end


end
