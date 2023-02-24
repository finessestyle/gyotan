class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  require 'exifr/jpeg'
  require "google_drive"
  
  def index
    @posts = Post.all.order(created_at: :desc) #or :asc

    credentials = Google::Auth::UserRefreshCredentials.new(
    client_id: "677012086743-br3mubt5md9u61329bd1413qij41hahk.apps.googleusercontent.com",
    client_secret: "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",
    scope: [
      "https://www.googleapis.com/auth/drive",
      "https://spreadsheets.google.com/feeds/",
    ],
    redirect_uri: "http://localhost:3000")
    puts "ここにアクセスしてください---" + credentials.authorization_uri.to_s
    credentials.code = params[:code]
    credentials.fetch_access_token!
    puts "REFRESH TOEKNゲットする---" + credentials.refresh_token.to_s
    @session = GoogleDrive.login_with_oauth(credentials.access_token)
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
    @post = Post.new( 
      title: params[:title],
      weather: params[:weather],
      content: params[:content],
      fish_area: params[:fish_area],
      length: params[:length],
      weight: params[:weight],
      lure: params[:lure],
      lure_color: params[:lure_color],
      catch_fish: params[:catch_fish],
      user_id: @current_user.id
    )

    if @post.save
      if params[:image]
        @post.image = "#{@post.id}.jpg"
        image = params[:image]
        File.binwrite("public/post_images/#{@post.image}", image.read)
        @post.save
      end

      @post.save
      flash[:notice] = "投稿を作成しました"
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
    @post.title = params[:title]
    @post.content = params[:content]
    @post.weather = params[:weather]
    @post.fish_area = params[:fish_area]
    @post.length = params[:length]
    @post.weight = params[:weight]
    @post.catch_fish = params[:catch_fish]
    @post.lure = params[:lure]
    @post.lure_color = params[:lure_color]

    if params[:image]
      @post.image = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image}", image.read)
    end

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
  
end
