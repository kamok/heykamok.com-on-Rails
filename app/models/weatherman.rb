class Weatherman < ActiveRecord::Base

  def self.current_temp(ip)
    ip_metadata = open("http://ip-api.com/json/#{ip}").read
    lat = JSON.parse(ip_metadata)["lat"]
    lng = JSON.parse(ip_metadata)["lon"]

    ForecastIO.forecast(lat, lng).currently["temperature"]
    
  end

  private 

end