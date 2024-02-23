class UsersController < ApplicationController
  #ログイン中のユーザーが出来る事
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  #ログイン中のユーザーが出来ない事
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  #ログインiDとユーザーidが等しい時に出来る事
  before_action :ensure_correct_user, {only: [:edit, :update]}
  require 'mini_magick'

  def index
    @users = User.all.order(created_at: :asc)
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      flash[:notice] = "退会しました"
    else
      flash[:alert] = "ユーザーが見つかりませんでした"
    end
    redirect_to "/"
  end

  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :image, :password, :profile,)
    end
end
