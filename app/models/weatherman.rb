require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
#disable this in production
#disable this in production

class Weatherman < ActiveRecord::Base

  def prepare_forecast(query)
    prepare_geo_data(query)
    get_weather_data
    build_forecast
  end

  private

  def prepare_geo_data(query)
    geo_metadata = open('https://maps.googleapis.com/maps/api/geocode/json?address=' + query + '&key=AIzaSyCAARRQCHp-g71b1k8up7GkbflSLeI02XY').read
    @lat = JSON.parse(geo_metadata)["results"][0]["geometry"]["location"]["lat"]
    @lng = JSON.parse(geo_metadata)["results"][0]["geometry"]["location"]["lng"]
    @location = JSON.parse(geo_metadata)["results"][0]["formatted_address"]
  end

  def get_weather_data
    @forecast_metadata = ForecastIO.forecast(@lat, @lng)
  end

  def build_forecast
    {}.tap do |forecast|
      forecast["location"] = @location
      forecast["current_temp"] = @forecast_metadata.currently["temperature"]
      get_repeating_weather_parameters
      7.times do |i|
        forecast["day#{i}"] = {
          "date" => @dates[i],
          "day" => @days[i],
          "max" => @maxes[i],
          "min" => @mins[i],
          "summary" => @summaries[i],
          "icon" => @icons[i]
        }
      end
    end
  end

  def get_repeating_weather_parameters
    @dates, @days, @maxes, @mins, @summaries, @icons = [],[],[],[],[],[]
    7.times do |i|
      @dates << Time.at(@forecast_metadata.daily.data[i]["time"]).strftime("%-m/%-d")
      @days << Time.at(@forecast_metadata.daily.data[i]["time"]).strftime("%A")
      @maxes << @forecast_metadata.daily.data[i]["temperatureMax"]
      @mins << @forecast_metadata.daily.data[i]["temperatureMin"]
      @summaries << @forecast_metadata.daily.data[i]["summary"]
      @icons << @forecast_metadata.daily.data[i]["icon"]
    end
  end

end