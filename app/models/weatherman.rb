class Weatherman < ActiveRecord::Base

  def self.current_temp
    # ip = get_ip
    geo_code = ip_to_geo
    lat = geo_code[0]
    lng = geo_code[1]
    ForecastIO.forecast(lat, lng).currently["temperature"]
  end

  private 

  # def get_ip
  #   request.remote_ip
  # end

  def self.ip_to_geo
    data = open('http://ip-api.com/json/'+ @client_ip.to_s ).read
    lat = JSON.parse(data)["lat"]
    lng = JSON.parse(data)["lon"]
    geo_array = [lat, lng]
  end
end
