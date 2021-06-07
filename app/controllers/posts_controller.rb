class PostsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def index
  end

  private 
  def post_params 
    params.require(:post).permit(:title, :content)
  end
end
