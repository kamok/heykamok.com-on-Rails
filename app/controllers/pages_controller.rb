class PagesController < ApplicationController
  def home
  end

  def toys
    @client_ip = request.remote_ip
  end

  def blog
    @post = Post.all
  end

end
