class PagesController < ApplicationController
  def home
  end

  def about
  end

  def blog
    @post = Post.all
  end
end
