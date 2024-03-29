class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  require 'exifr/jpeg'
  require "google_drive"
  require 'mini_magick'

  def index
    @posts = Post.all.order(created_at: :desc) #or :asc
    @post1 = Post.where(fish_area: "北湖北エリア")
    @post2 = Post.where(fish_area: "北湖東エリア")
    @post3 = Post.where(fish_area: "北湖西エリア")
    @post4 = Post.where(fish_area: "南湖東エリア")
    @post5 = Post.where(fish_area: "南湖西エリア")
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)

    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :weather, :fish_area, :length, :weight, :catch_fish, :lure, :lure_color, { images: [] }).merge(:user_id => @current_user.id)
    end
end
