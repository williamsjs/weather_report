require 'minitest/autorun'
require 'minitest/pride'

require './location.rb'
require './conditions.rb'
require 'byebug'


class Test < Minitest::Test

  def test_assert_location
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/CA/San_Francisco.json")

    assert_equal "CA", weather["current_observation"]["display_location"]["state"]
  end

  def test_assert_location_with_zip
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/37212.json")

    assert_equal "TN", weather["current_observation"]["display_location"]["state"]
  end

  def test_location
    assert Location
  end

  def test_store_user_input_in_user
    user_input = "37212".to_i

    location = Location.new(user_input)
    assert_equal 37212, location.zip
  end

  def test_class_condition_f_temp
    location = Location.new(27030)
    mount_airy = Conditions.new(location)
    assert_in_delta 100, 100, mount_airy.fahrenheit
  end

  def test_condition_c_temp
    location = Location.new(27030)
    mount_airy = Conditions.new(location)
    assert_in_delta 100, 100, mount_airy.celsius
  end

end
