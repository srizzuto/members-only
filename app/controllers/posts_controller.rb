class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    user = User.find(current_user.id)
    @post = user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Post saved successfully.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Error trying to save your post.'
      render 'new'
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
