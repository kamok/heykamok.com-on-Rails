class PagesController < ApplicationController
  def home
  end

  def toys
    @weather_array = Weatherman.get_weather(cookies[:client_ip])
  end

  def blog
    @post = Post.all
  end

  private

  
end
