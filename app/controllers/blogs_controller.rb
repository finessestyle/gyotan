class BlogsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @blogs = Blog.all.order(created_at: :desc)
    @users = User.page(params[:page]).per(10)
  end
    
  def show
    @blog = Blog.find_by(id: params[:id])
    @user = @blog.user
    @likes_count = Like.where(blog_id: @blog.id).count
  end

  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    
    if @blog.save
      flash[:notice] = "投稿しました"
      redirect_to("/blogs")
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

  # def ensure_correct_user
  #   @blog = Blog.find_by(id: params[:id])
  #     if @blog.user_id != @current_user.id
  #     flash[:notice] = "権限がありません"
  #     redirect_to("/blogs/index")
  #   end
  # end

  private
    # Only allow a list of trusted parameters through.
    def blog_params
      params.permit(:title, :content, :image).merge(:user_id => @current_user.id)
    end

end
