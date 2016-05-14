class ApplicationController < ActionController::Base
  before_action :cache_ip
  protect_from_forgery with: :exception
  
  def cache_ip
    if Rails.env.production?
      cookies[:client_ip] = request.remote_ip
    else 
      cookies[:client_ip] = "138.0.181.122"
    end
  end
end