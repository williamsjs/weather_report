require 'minitest/autorun'
require 'minitest/pride'

require './location.rb'
require './conditions.rb'
require './ten_day.rb'
require './sunrise_sunset.rb'
require './alert.rb'
require './hurricane'
require 'byebug'


class Test < Minitest::Test

  # def test_assert_location
  #   weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/CA/San_Francisco.json")
  #
  #   assert_equal "CA", weather["current_observation"]["display_location"]["state"]
  # end
  #
  # def test_assert_location_with_zip
  #   weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/37212.json")
  #
  #   assert_equal "TN", weather["current_observation"]["display_location"]["state"]
  # end
  #
  # def test_location
  #   assert Location
  # end
  #
  # def test_store_user_input_in_user
  #   user_input = "37212".to_i
  #
  #   location = Location.new(user_input)
  #   assert_equal 37212, location.zip
  # end
  #
  # def test_class_condition_f_temp
  #   location = Location.new(27030)
  #   mount_airy = Conditions.new(location)
  #   assert mount_airy.fahrenheit
  # end
  #
  # def test_condition_c_temp
  #   location = Location.new(27030)
  #   mount_airy = Conditions.new(location)
  #   assert mount_airy.celsius
  # end
  #
  # def test_condition_humidity
  #   location = Location.new(27030)
  #   mount_airy = Conditions.new(location)
  #   assert mount_airy.humidity
  # end
  #
  # def test_condition_weather
  #   mount_airy = Location.new(27030)
  #   mount_airy_conditions = Conditions.new(mount_airy)
  #   assert mount_airy_conditions.sky
  # end
  #
  # def test_ten_day_1
  #   mount_airy = Location.new(27030)
  #   mount_airy_forecast = TenDayForecast.new(mount_airy)
  #   assert mount_airy_forecast.forecast
  # end

  # def test_sunrise_passed_location_value
  #   charleston = Location.new(29403)
  #   day_1 = SunriseSunset.new(charleston)
  #
  #   assert day_1
  # end

  # def test_sunrise_time
  #   charleston = Location.new(29403)
  #   charleston_sun = SunriseSunset.new(charleston)
  #   assert charleston_sun.sunrise
  # end

  # def test_sunset_time
  #   nashville = Location.new(37212)
  #   nashville_sun = SunriseSunset.new(nashville)
  #   assert nashville_sun.sunset
  # end

  # def test_alert_class
  #   hillsborough = Location.new(27278)
  #   hillsborough_alert = Alert.new(hillsborough)
  #
  #   assert hillsborough_alert
  # end

  # def test_alert_message
  #   oklahoma_city = Location.new(73101)
  #   oklahoma_city_alert = Alert.new(oklahoma_city)
  #
  #   assert oklahoma_city_alert.alert_message
  # end

  def test_hurricane_takes_location
    mount_airy = Location.new(27030)
    hurricane = Hurricane.new(mount_airy)

    assert_equal 27030, hurricane.zip
  end


end
