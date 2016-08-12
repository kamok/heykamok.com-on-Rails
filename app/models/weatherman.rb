require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
#disable this in production
#disable this in production

class Weatherman < ActiveRecord::Base
  attr_reader :query, :lat, :lng, :location

  def prepare_forecast(query)
    @query = query
    prepare_geo_data
    get_weather_data
    build_forecast
  end

  private

  def prepare_geo_data
    geo_metadata = open('https://maps.googleapis.com/maps/api/geocode/json?address=' + query + '&key=AIzaSyCAARRQCHp-g71b1k8up7GkbflSLeI02XY').read
    @lat = JSON.parse(geo_metadata)["results"][0]["geometry"]["location"]["lat"]
    @lng = JSON.parse(geo_metadata)["results"][0]["geometry"]["location"]["lng"]
    @location = JSON.parse(geo_metadata)["results"][0]["formatted_address"]
  end

  def get_weather_data
    @forecast_metadata = ForecastIO.forecast(lat, lng)
    get_dates
  end

  def build_forecast
    forecast = {}
    forecast["location"] = location
    forecast["current_temp"] = get_current_temp
    7.times do |i|
      forecast["day#{i}"] = {
        "date" => @dates[i]
        # "day" => "@dates[i]",
        # "max" => "@dates[i]",
        # "min" => "@dates[i]",
        # "summary" => "@dates[i]",
        # "icon" => "@dates[i]"
      }
    end
    forecast
  end

  def get_current_temp
    @forecast_metadata.currently["temperature"]
  end

  def get_dates
    @dates = []
    7.times { |i| @dates << Time.at(@forecast_metadata.daily.data[i]["time"]).strftime("%-m/%-d") }
  end

  # def build_min
  # end

  # def build_max
  # end

end