class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post has been created."
      redirect_to @post
    else
      flash[:alert] = "Post has not been created."

      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)

    if @post.save
      flash[:notice] = "Post has been updated."
      redirect_to @post
    else
      flash[:notice] = "Post has not been updated."
      render "edit"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end

end
