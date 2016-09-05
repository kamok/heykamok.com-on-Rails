class PagesController < ApplicationController
  def home
  end

  def toys
  end

  def blog
    @post = Post.all
  end

  def reading_list
    @reading_list = ReadingList.first
  end
   
end
