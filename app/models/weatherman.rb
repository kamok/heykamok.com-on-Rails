class Weatherman < ActiveRecord::Base
  attr_reader :query

  def prepare_forecast(query)
    @query = query
    prepare_geo_data
  end

  def prepare_geo_data
    geo_metadata = open('https://maps.googleapis.com/maps/api/geocode/json?address=' + query + '&key=AIzaSyCAARRQCHp-g71b1k8up7GkbflSLeI02XY').read
    p geo_metadata
    # @lat = JSON.parse(ip_metadata)["lat"]
    # @lng = JSON.parse(ip_metadata)["lon"]
    # @city_and_country = JSON.parse(ip_metadata)["city"] + ", " + JSON.parse(ip_metadata)["country"]
  end

  def get_weather_data(lat, lng)
    @forecast = ForecastIO.forecast(lat, lng)
  end

end