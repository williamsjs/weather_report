require 'minitest/autorun'
require 'minitest/pride'
require 'json'

require './location.rb'
require './conditions.rb'
require './ten_day.rb'
require './sunrise_sunset.rb'
require './alert.rb'
require './hurricane'
require 'byebug'

class Conditions

  private def get_weather
    @weather = JSON.parse(File.open('conditions.json').read)['current_observation']
  end

end

class TenDayForecast

  private def get_weather
    @weather = JSON.parse(File.open('ten_day.json').read)["forecast"]["simpleforecast"]["forecastday"]
  end

end

class Hurricane

  private def get_weather
    @weather = JSON.parse(File.open('hurricane.json').read)["currenthurricane"]
  end

end

class SunriseSunset

  private def get_weather
    @weather = JSON.parse(File.open('sunrise.json').read)["sun_phase"]
  end

end

class Alert

  private def get_weather
    @weather = JSON.parse(File.open('alert.json').read)
  end

end


class Test < Minitest::Test

  def test_assert_location
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/CA/San_Francisco.json")

    assert_equal "CA", weather["current_observation"]["display_location"]["state"]
  end

  def test_location_with_zip
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/37212.json")

    assert_equal "TN", weather["current_observation"]["display_location"]["state"]
  end

  def test_location_with_string

  end

  def test_location
    assert Location
  end

  def test_store_user_input_zip_in_user
    user_input = "37212"

    location = Location.new(user_input)
    assert_equal "37212", location.zip
  end

  def test_store_user_input_zip_in_user
    user_input = "37212"

    location = Location.new(user_input)
    assert_equal "37212", location.zip
  end

  def test_class_condition_f_temp
    location = Location.new("27030")
    mount_airy = Conditions.new(location)
    assert_equal "Temperature: \nfahrenheit: 75.2", mount_airy.fahrenheit
  end

  def test_condition_c_temp
    location = Location.new("27030")
    mount_airy = Conditions.new(location)
    assert_equal "celsius: 24.0", mount_airy.celsius
  end

  def test_condition_humidity
    location = Location.new("27030")
    mount_airy = Conditions.new(location)

    assert_equal "humidity: 33%", mount_airy.humidity
  end

  def test_condition_weather
    mount_airy = Location.new("27030")
    mount_airy_conditions = Conditions.new(mount_airy)
    assert_equal "sky: Clear", mount_airy_conditions.sky
  end

  def test_ten_day_forecast
    mount_airy = Location.new("27030")
    mount_airy_forecast = TenDayForecast.new(mount_airy)
    assert_equal "Your ten day forecast is: \n\n5/22/2015\n      \thigh of 75F, 24C\n      \tLow of 48F, 9C\n5/23/2015\n      \thigh of 79F, 26C\n      \tLow of 54F, 12C\n5/24/2015\n      \thigh of 83F, 28C\n      \tLow of 57F, 14C\n5/25/2015\n      \thigh of 87F, 31C\n      \tLow of 62F, 17C\n5/26/2015\n      \thigh of 87F, 31C\n      \tLow of 63F, 17C\n5/27/2015\n      \thigh of 87F, 31C\n      \tLow of 63F, 17C\n5/28/2015\n      \thigh of 89F, 32C\n      \tLow of 64F, 18C\n5/29/2015\n      \thigh of 91F, 33C\n      \tLow of 64F, 18C\n5/30/2015\n      \thigh of 90F, 32C\n      \tLow of 65F, 18C\n5/31/2015\n      \thigh of 89F, 32C\n      \tLow of 65F, 18C\n",
    mount_airy_forecast.ten_day
  end

  def test_sunrise_passed_location_value
    mount_airy = Location.new("27030")
    day_1 = SunriseSunset.new(mount_airy)
    assert day_1
  end

  def test_sunrise_time
    mount_airy = Location.new("27030")
    mount_airy_sun = SunriseSunset.new(mount_airy)
    assert_equal "Sunrise - 6:10",
    mount_airy_sun.sunrise
  end

  def test_sunset_time
    mount_airy = Location.new("37212")
    mount_airy_sun = SunriseSunset.new(mount_airy)
    assert_equal "Sunset - 20:27", mount_airy_sun.sunset
  end

  def test_alert_class
    mount_airy = Location.new("27030")
    mount_airy_alert = Alert.new(mount_airy)

    assert mount_airy_alert
  end

  def test_alert_message
    oklahoma_city = Location.new("73101")
    oklahoma_city_alert = Alert.new(oklahoma_city)
    assert_equal ["WARNING!\nDescription: Flash Flood Watch \nMessage: \n...Flash Flood Watch remains in effect through Monday morning...\n\nThe Flash Flood Watch continues for\n\n* all of central...southern...and southwestern Oklahoma...and all\n of western North Texas. \n\n* Through Monday morning\n\n* up to an inch of rainfall possible through midnight tonight\n\n* Saturday and Sunday 2 to 5 inches of rainfall expected with\n locally higher amounts\n\nPrecautionary/preparedness actions...\n\nMonitor weather forecasts and information. Avoid travel in\nflooded areas...and make plans to get to higher ground if\nflooding develops or worsens in your area.\n\n\n\nMbs\n\n\n\n"],
    oklahoma_city_alert.alert_message
  end

  def test_hurricane_name_list
    hurricane = Hurricane.new
    assert_equal "Hurricane/Storm Name: 90E", hurricane.list[0]
  end

end
