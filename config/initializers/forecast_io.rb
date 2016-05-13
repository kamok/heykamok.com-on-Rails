require 'forecast_io'
require 'openssl'
require 'open-uri'
require 'csv'

ForecastIO.configure do |config|    
  config.api_key = Figaro.env.forecast_io_key  
end