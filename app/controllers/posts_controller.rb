class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts.find(params[:id])
  end

  def new
    # render the page for creeating form
  end

  def create
    # create the form
  end
end
