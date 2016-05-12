class PagesController < ApplicationController
  def home
  end

  def toys
  end

  def blog
    @post = Post.all
  end
end
