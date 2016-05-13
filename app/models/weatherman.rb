class Weatherman < ActiveRecord::Base

  def self.current_temp(lat, lng)
    ForecastIO.forecast(lat, lng).currently["temperature"]
  end
  
end
