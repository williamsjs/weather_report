require 'httparty'

class Location
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

end
