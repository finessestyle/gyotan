class BlogsController < ApplicationController
  before_action :ensure_correct_user, {only:[:edit, :update, :destroy]}
  
  def index
    @blogs = Blog.all.order(created_at: :desc)
  end
    
  def show
    @blog = Blog.find_by(id: params[:id])
  end

  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(
      title: params[:title],
      sub_title: params[:sub_title],
      image: params[:image],
      content: params[:content],
      user_id: @current_user.id
    )

    if params[:image]
      @blog.image = "#{@blog.id}.jpg"
      image = params[:image]
      File.binwrite("public/blog_images/#{@blog.image}", image.read)
    end

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
    @blog.title = params[:title],
    @blog.sub_title = params[:sub_title],
    @blog.image = params[:image],
    @blog.content = params[:content]

    if params[:image]
      @blog.image = "#{@blog.id}.jpg"
      image = params[:image]
      File.binwrite("blog_images/#{@blog.image}", image.read)
    end

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
    
end
