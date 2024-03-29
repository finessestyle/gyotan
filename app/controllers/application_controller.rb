class ApplicationController < ActionController::Base
  before_action :set_current_user
  require 'mini_magick'

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
      
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "新規登録が必要です"
      redirect_to("/signup")
    end
  end
      
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
  
end
