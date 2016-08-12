class WeathermanController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def get_weather
    custom_weather_data = Weatherman.new.prepare_forecast(params[:location_query])
    render json: custom_weather_data
  end
end


# This cool javascript snippet can be used in any browser's URL field in Bookmarks to make a test POST call. 
# javascript:var my_params=prompt("Enter your parameters","location_query=Italy"); var Target_LINK=prompt("Enter destination", location.href); function post(path, params) { var form = document.createElement("form"); form.setAttribute("method", "post"); form.setAttribute("action", path); for(var key in params) { if(params.hasOwnProperty(key)) { var hiddenField = document.createElement("input"); hiddenField.setAttribute("name", key); hiddenField.setAttribute("value", params[key]); form.appendChild(hiddenField); } } document.body.appendChild(form); form.submit(); } parsed_params={}; my_params.split("&").forEach(function(item) {var s = item.split("="), k=s[0], v=s[1]; parsed_params[k] = v;}); post(Target_LINK, parsed_params); void(0);