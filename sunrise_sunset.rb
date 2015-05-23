require 'httparty'

class SunriseSunset
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = get_weather
  end

  def sunrise
    "Sunrise - #{weather["sunrise"]["hour"]}:#{weather["sunrise"]["minute"]}"
  end

  def sunset
    "Sunset - #{weather["sunset"]["hour"]}:#{weather["sunset"]["minute"]}"
  end

  private def get_weather
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/astronomy/q/#{zip}.json")["sun_phase"]
  end


end
