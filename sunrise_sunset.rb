require 'httparty'

class SunriseSunset
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/astronomy/q/#{zip}.json")["sun_phase"]
  end

  def sunrise
    "Sunrise - #{weather["sunrise"]["hour"]}:#{weather["sunrise"]["minute"]}"
  end

  def sunset
    "sunset = #{weather["sunset"]["hour"]}:#{weather["sunset"]["minute"]}"
  end


end
