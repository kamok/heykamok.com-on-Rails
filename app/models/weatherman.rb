class Weatherman < ActiveRecord::Base

  def self.prepare_weather(client_ip)
    geocode_array = prepare_geocode(client_ip)
    get_weather_data(geocode_array)
    store_weather
  end

  def self.store_weather
    current_temp = get_current_temp(@forecast)
    max_temp_today = get_max_temp_today(@forecast)
    min_temp_today = get_min_temp_today(@forecast)
    summary_today = get_summary_today(@forecast)

    [current_temp, max_temp_today, min_temp_today, summary_today]
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

  def self.get_max_temp_today(forecast)
    forecast.daily.data[0]["temperatureMax"]
  end

  def self.get_min_temp_today(forecast)
    forecast.daily.data[0]["temperatureMin"]
  end

  def self.get_summary_today(forecast)
    forecast.currently["summary"]
  end

end