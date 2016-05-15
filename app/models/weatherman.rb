class Weatherman < ActiveRecord::Base

  def self.prepare_weather(client_ip)
    geocode_array = prepare_geocode(client_ip)
    get_weather_data(geocode_array)
    store_weather
  end

  def self.store_weather
    weather_parameters =
    ["current_temp", "max_temp_day0", "min_temp_day0",  #0-2
     "max_temp_day1", "min_temp_day1", "max_temp_day2", #3-5
     "min_temp_day2", "max_temp_day3", "min_temp_day3", #6-8
     "current_summary_day0", "day_day0", "day_day1",    #9-11
     "day_day2", "day_day3", "date_day0",               #12-14
     "date_day1", "date_day2", "date_day3",             #15-17
     "icon_day0", "icon_day1", "icon_day2",             #18-20
     "icon_day3", "summary_day0", "summary_day1",       #21-23   
     "summary_day2", "summary_day3"]                    #24-25                                       

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

  def self.get_current_summary_day0(forecast)
    forecast.currently["summary"]
  end

  def self.get_day_day0(forecast)
    hour_now = Time.at(forecast.currently["time"]).strftime("%H")
    if hour_now.to_i < 18
      return "Today" 
    else 
      return "Tonight"      
    end
  end

  def self.get_day_day1(forecast)
    Time.at(forecast.daily.data[1]["time"]).strftime("%A")
  end

  def self.get_day_day2(forecast)
    Time.at(forecast.daily.data[2]["time"]).strftime("%A")
  end

  def self.get_day_day3(forecast)
    Time.at(forecast.daily.data[3]["time"]).strftime("%A")
  end

  def self.get_date_day0(forecast)
    date = Time.at(forecast.currently["time"]).strftime("%m/%d")
  end

  def self.get_date_day1(forecast)
    date = Time.at(forecast.daily.data[1]["time"]).strftime("%m/%d")
  end

  def self.get_date_day2(forecast)
    date = Time.at(forecast.daily.data[2]["time"]).strftime("%m/%d")
  end

  def self.get_date_day3(forecast)
    date = Time.at(forecast.daily.data[3]["time"]).strftime("%m/%d")
  end

  def self.get_icon_day0(forecast)
    icon = forecast.currently["icon"]
    translate_icon_verbage(icon)
  end

  def self.get_icon_day1(forecast)
    icon = forecast.daily.data[1]["icon"]
    translate_icon_verbage(icon)
  end

  def self.get_icon_day2(forecast)
    icon = forecast.daily.data[2]["icon"]
    translate_icon_verbage(icon)
  end

  def self.get_icon_day3(forecast)
    icon = forecast.daily.data[3]["icon"]
    translate_icon_verbage(icon)
  end

  def self.translate_icon_verbage(forecast_icon)
    forecast_to_wi_icon = {
      "clear-day":           "day-sunny",
      "clear-night":         "night-clear",
      "rain":                "rain",
      "snow":                "snow",
      "sleet":               "hail",
      "wind":                "strong-wind",
      "fog":                 "fog",
      "cloudy":              "cloudy",
      "partly-cloudy-day":   "day-cloudy",
      "partly-cloudy-night": "night-cloudy"
    }

    if forecast_to_wi_icon[forecast_icon.to_sym]
      forecast_to_wi_icon[forecast_icon.to_sym]
    else
      "wi-na"
    end
  end

  def self.get_summary_day0(forecast)
    forecast.daily.data[0]["summary"]
  end

  def self.get_summary_day1(forecast)
    forecast.daily.data[1]["summary"]
  end

  def self.get_summary_day2(forecast)
    forecast.daily.data[2]["summary"]
  end

  def self.get_summary_day3(forecast)
    forecast.daily.data[3]["summary"]
  end

end