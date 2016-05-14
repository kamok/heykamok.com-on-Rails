class ApplicationController < ActionController::Base
  before_action :cache_ip
  protect_from_forgery with: :exception
  
  def cache_ip
    cookies[:client_ip] = "71.125.43.37"#request.remote_ip
  end
end
