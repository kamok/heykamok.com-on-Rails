class PagesController < ApplicationController
  def home
  end

  def toys
    @weather_array = Weatherman.prepare_weather(cookies[:client_ip])
  end

  def blog
    @post = Post.all
  end

  def reading_list
    @reading_list = ReadingList.first
  end

  private

  
end
