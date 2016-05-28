class ApplicationController < ActionController::Base
  before_action :cache_ip
  protect_from_forgery with: :exception
  
  def cache_ip
    if Rails.env.production?
      cookies[:client_ip] = request.remote_ip
    else 
      cookies[:client_ip] = "72.229.28.185"
    end
  end

end