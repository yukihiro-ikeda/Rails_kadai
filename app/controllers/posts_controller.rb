class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update,:destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to new_post_path
    else
      render :new
    end
  end

  def confirm
    @post = Post.new(post_params)
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"つぶやきを削除しました！"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
