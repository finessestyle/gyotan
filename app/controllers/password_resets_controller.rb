class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
        #メールを送る
        PasswordResetMailer.with(@user).reset.deliver_later
        flash[:notice] = "パスワードのリセットメールを送りました。"
        redirect_to("/")
    else
        flash[:notice] = "メールアドレスが見つかりませんでした。"
        render("password_resets/new")
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      flash[:danger] = "URLの有効期限が切れています。もう一度リクエストお願いします。"
      redirect_to password_reset_path
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      flash[:success] = "パスワードをリセットされました。ログインしてください。"
	    redirect_to "/login"
    else
      flash.now[:danger] = "パスワードのリセットに失敗しました。もう一度お試しください。"
      render :edit
    end
  end

  private

  def password_params
      params.require(:user).permit(:password, :password_confirmation)
  end
end
