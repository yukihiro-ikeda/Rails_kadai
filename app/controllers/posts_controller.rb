class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(content: params[:post][:content])
    redirect_to new_post_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
