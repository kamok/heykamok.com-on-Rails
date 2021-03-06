if Rails.env.development? || Rails.env.test?
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

class Weatherman < ActiveRecord::Base

  attr_reader :lat, :lng, :location

  def prepare_forecast(query)
    prepare_geo_data(query)
    get_weather_data
    build_forecast
  end

  private

  def prepare_geo_data(query)
    geo_metadata = open('https://maps.googleapis.com/maps/api/geocode/json?address=' + query + '&key=' + Figaro.env.google_maps_api_key).read
    @lat = JSON.parse(geo_metadata)["results"][0]["geometry"]["location"]["lat"]
    @lng = JSON.parse(geo_metadata)["results"][0]["geometry"]["location"]["lng"]
    @location = JSON.parse(geo_metadata)["results"][0]["formatted_address"]
  end

  def get_weather_data
    @forecast_metadata = ForecastIO.forecast(@lat, @lng)
  end

  def build_forecast
    #This Hash.new {...} is so we can do nested hash side by side later on.
    forecast = Hash.new { |h,k| h[k]=Hash.new(&h.default_proc) } 
      forecast["location"] = @location
      forecast["current_temp"] = @forecast_metadata.currently["temperature"]
      forecast["current_summary"] = @forecast_metadata.currently["summary"]
      get_repeating_weather_parameters
      
      8.times do |i|
        forecast["weekly_forecast"]["day#{i}"] = {
          "date" => @dates[i],
          "day" => @days[i],
          "max" => @maxes[i],
          "min" => @mins[i],
          "summary" => @summaries[i],
          "icon" => @icons[i]
        }
      end
    forecast
  end

  def get_repeating_weather_parameters
    @dates, @days, @maxes, @mins, @summaries, @icons = [],[],[],[],[],[]
    8.times do |i|
      @dates << Time.at(@forecast_metadata.daily.data[i]["time"]).strftime("%-m/%-d")
      @days << Time.at(@forecast_metadata.daily.data[i]["time"]).strftime("%A")
      @maxes << @forecast_metadata.daily.data[i]["temperatureMax"]
      @mins << @forecast_metadata.daily.data[i]["temperatureMin"]
      @summaries << @forecast_metadata.daily.data[i]["summary"]
      @icons << translate_icon_verbage(@forecast_metadata.daily.data[i]["icon"])
    end
  end

  def translate_icon_verbage(icon)
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
    forecast_to_wi_icon[icon.to_sym] ? forecast_to_wi_icon[icon.to_sym] : "na"
  end
end