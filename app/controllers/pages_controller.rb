class PagesController < ApplicationController
  def home
  end

  def toys
    @current_temp = Weatherman.current_temp(cookies[:client_ip])
  end

  def blog
    @post = Post.all
  end

  private

  
end
