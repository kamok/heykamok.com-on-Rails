class ApplicationController < ActionController::Base
  before_action :cache_ip
  protect_from_forgery with: :exception
  
  def cache_ip
    cookies[:client_ip] = request.remote_ip
  end
end
