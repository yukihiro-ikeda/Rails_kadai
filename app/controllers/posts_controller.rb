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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def create
    Post.create(content: params[:post][:content])
    @post = Post.new(post_params)
    if @post.save
    redirect_to new_post_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
