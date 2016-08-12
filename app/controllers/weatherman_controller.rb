class WeathermanController < ApplicationController
  def get_weather
    weatherman = Weatherman.new
    custom_weather_data = weather.prepare_forecast(params[:location_query])

    puts custom_weather_data
    # render json: custom_weather_data
  end
end