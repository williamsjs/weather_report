require 'httparty'

class Hurricane
  attr_reader :zip, :weather

  def initialize(location)
    @zip = location.zip
    @weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/view.json")
  end
  

end
