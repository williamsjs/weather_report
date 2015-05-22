require 'json'


class hurricane

  private def get_data
    @page = JSON.parse(File.open("astronomy.json").read)
  end

end

class hurricane
  def initialize(zip)
    @zip = zip
    @page = get_data
  end



  private def get_data
    HTTParty.get("site")
  end

end
