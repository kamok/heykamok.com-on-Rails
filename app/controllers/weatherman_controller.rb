class WeathermanController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def get_weather
    custom_weather_data = Weatherman.new.prepare_forecast(params[:location_query])
    render json: custom_weather_data
  end
end