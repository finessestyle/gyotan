class BlogsController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  require 'mini_magick'

  def index
    @blogs = Blog.all.order(created_at: :desc) #or :asc
  end

  def show
    @blog = Blog.find_by(id: params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "投稿しました"
      redirect_to("/blogs/index")
    else
      render("blogs/new")
    end
  end

  def edit
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    @blog = Blog.find_by(id: params[:id])
    @blog.update(blog_params)

    if @blog.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/blogs/index")
    else
      render("blogs/edit")
    end
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/blogs/index")
  end

  def ensure_correct_user
    @blog = Blog.find_by(id: params[:id])
    if @blog.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/blogs/index")
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content, :image).merge(:user_id => @current_user.id)
    end

end
