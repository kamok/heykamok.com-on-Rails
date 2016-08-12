require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
#disable this in production
#disable this in production

class Weatherman < ActiveRecord::Base
  attr_reader :query, :lat, :lng, :forecast_metadata, :location

  def prepare_forecast(query)
    @query = query
    prepare_geo_data
    get_weather_data

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
  end

  def build_forecast
    forecast = {}
    forecast["7-days-min"] = build_min
    forecast["7-days-max"] = build_max
    forecast["current_temp"] = 
  end

  def build_min
  end

  def build_max
  end

end