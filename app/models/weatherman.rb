class Weatherman < ActiveRecord::Base

  NON_REPEATING_WEATHER_PARAMETERS = 
  ["current_temp", "current_summary", "get_day_today", "city_and_country" ]

  REPEATING_WEATHER_PARAMETERS = 
  ["min_temp_day0", "min_temp_day1", "min_temp_day2", "min_temp_day3", 
   "max_temp_day0", "max_temp_day1", "max_temp_day2", "max_temp_day3", 
   "day_day1", "day_day2", "day_day3", 
   "date_day0", "date_day1", "date_day2", "date_day3",             
   "icon_day0", "icon_day1", "icon_day2", "icon_day3", 
   "summary_day0", "summary_day1", "summary_day2", "summary_day3"]

  def self.prepare_weather(client_ip)
    prepare_geocode(client_ip)
    get_weather_data
    parse_and_store_weather_data
  end

  private 

  def self.parse_and_store_weather_data                              

    stored_weather = []

    NON_REPEATING_WEATHER_PARAMETERS.each do |parameter|
      if parameter == "current_temp"
        stored_weather << Weatherman.get_current_temp
      elsif parameter == "current_summary"
        stored_weather << Weatherman.get_current_summary
      elsif parameter == "get_day_today"
        stored_weather << Weatherman.get_day_today
      elsif parameter == "city_and_country"
        stored_weather << @city_and_country
      end
    end

    REPEATING_WEATHER_PARAMETERS.each do |parameter|
      if parameter.include?("min_temp_day") 
        day = parameter[-1].to_i
        stored_weather << Weatherman.get_min_temp_for_day(day)
      elsif parameter.include?("max_temp_day") 
        day = parameter[-1].to_i
        stored_weather << Weatherman.get_max_temp_for_day(day)
      elsif parameter.include?("day_day") 
        day = parameter[-1].to_i
        stored_weather << Weatherman.get_day_for_day(day)
      elsif parameter.include?("date_day") 
        day = parameter[-1].to_i
        stored_weather << Weatherman.get_date_for_day(day)
      elsif parameter.include?("icon_day") 
        day = parameter[-1].to_i
        stored_weather << Weatherman.get_icon_for_day(day)
      else parameter.include?("summary_day")
        day = parameter[-1].to_i
        stored_weather << Weatherman.get_summary_for_day(day)
      end
    end

    stored_weather
  end

  def self.prepare_geocode(client_ip)
    ip_metadata = open("http://ip-api.com/json/#{client_ip}").read
    @lat = JSON.parse(ip_metadata)["lat"]
    @lng = JSON.parse(ip_metadata)["lon"]
    @city_and_country = JSON.parse(ip_metadata)["city"] + ", " + JSON.parse(ip_metadata)["country"]
  end

  def self.get_weather_data
    @forecast = ForecastIO.forecast(@lat, @lng)
  end

  #NON_REPEATING_WEATHER_PARAMETERS
  def self.get_current_temp
    @forecast.currently["temperature"]
  end

  def self.get_current_summary
    @forecast.currently["summary"]
  end

  def self.get_day_today
    hour_now = Time.at(@forecast.currently["time"]).strftime("%H")
    if hour_now.to_i < 18  ##If < 6PM, then return "Today" 
      "Today" 
    else                   ##Else, return "Tonight"
      "Tonight"     
    end
  end

  #REPEATING_WEATHER_PARAMETERS
  def self.get_min_temp_for_day(day)
    @forecast.daily.data[day]["temperatureMin"]
  end

  def self.get_max_temp_for_day(day)
    @forecast.daily.data[day]["temperatureMax"]
  end

  def self.get_day_for_day(day)
    Time.at(@forecast.daily.data[day]["time"]).strftime("%A")
  end

  def self.get_date_for_day(day)
   Time.at(@forecast.daily.data[day]["time"]).strftime("%m/%d")
  end

  def self.get_icon_for_day(day)
    icon = @forecast.daily.data[day]["icon"]
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
      "na" ##returns the wi-na icon
    end
  end

  def self.get_summary_for_day(day)
    @forecast.daily.data[day]["summary"]
  end

end