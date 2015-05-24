require 'httparty'

class Location
  attr_reader :zip

  def initialize(place)
    if place =~ /^\d{5}/
      @zip = place
    elsif place =~ /^\w+\s\w+,\s\w{2}/
      zip = place.split(", ")
      zip[0] = zip[0].split(" ").join("_")
      zip = zip.reverse
      @zip = zip.join("/")
    else
      raise TypeError, "Value not valid"
    end
  end

end
