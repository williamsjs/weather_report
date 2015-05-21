require 'minitest/autorun'
require 'minitest/pride'
require './setup.rb'


class Test < Minitest::Test

  def test_assert_location
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/CA/San_Francisco.json")

    assert_equal "CA", weather["current_observation"]["display_location"]["state"]
  end

  def test_assert_location_with_zip
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/37212.json")

    assert_equal "TN", weather["current_observation"]["display_location"]["state"]
  end

  

end
