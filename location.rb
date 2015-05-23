require 'httparty'

class Location
  attr_reader :zip

  def initialize(zip)
    if zip.class == Fixnum
      @zip = zip
    else
      raise TypeError, "Value must be integer"
    end
  end

end
