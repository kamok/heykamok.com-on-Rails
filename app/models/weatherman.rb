class Weatherman < ActiveRecord::Base

  def self.prepare_weather(client_ip)
    geocode_array = prepare_geocode(client_ip)
    get_weather_data(geocode_array)
    store_weather
  end

  def self.store_weather
    weather_parameters =
    ["current_temp", "max_temp_day0", "min_temp_day0",
     "max_temp_day1", "min_temp_day1", "max_temp_day2",
     "min_temp_day2", "max_temp_day3", "min_temp_day3",
     "summary_day0"]

    stored_weather = []

    weather_parameters.each do |parameter|
      parameter = "get_" + parameter
      stored_weather << Weatherman.send(parameter, @forecast)
    end

    return stored_weather
  end

  private 

  def self.prepare_geocode(client_ip)
    ip_metadata = open("http://ip-api.com/json/#{client_ip}").read
    lat = JSON.parse(ip_metadata)["lat"]
    lng = JSON.parse(ip_metadata)["lon"]
    [lat, lng]
  end

  def self.get_weather_data(geocode_array)
    lat = geocode_array[0]
    lng = geocode_array[1]
    @forecast = ForecastIO.forecast(lat, lng)
  end

  def self.get_current_temp(forecast)
    forecast.currently["temperature"]
  end

  def self.get_max_temp_day0(forecast)
    forecast.daily.data[0]["temperatureMax"]
  end

  def self.get_min_temp_day0(forecast)
    forecast.daily.data[0]["temperatureMin"]
  end

  def self.get_max_temp_day1(forecast)
    forecast.daily.data[1]["temperatureMax"]
  end

  def self.get_min_temp_day1(forecast)
    forecast.daily.data[1]["temperatureMin"]
  end

  def self.get_max_temp_day2(forecast)
    forecast.daily.data[2]["temperatureMax"]
  end

  def self.get_min_temp_day2(forecast)
    forecast.daily.data[2]["temperatureMin"]
  end

  def self.get_max_temp_day3(forecast)
    forecast.daily.data[3]["temperatureMax"]
  end

  def self.get_min_temp_day3(forecast)
    forecast.daily.data[3]["temperatureMin"]
  end

  def self.get_summary_day0(forecast)
    forecast.currently["summary"]
  end
end