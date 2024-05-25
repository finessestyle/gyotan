class PasswordResetsController < ApplicationController
  rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :invalid_signature

  def new

  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      begin
        # メールを送る
        PasswordResetMailer.reset(@user).deliver_later
        flash[:success] = "リクエストありがとうございます。パスワードリセットメールを送りました。"
        redirect_to '/'
      rescue => e
        # メール送信に失敗した場合の処理
        Rails.logger.error("Failed to send password reset email: #{e.message}")
        flash[:danger] = "メール送信に失敗しました。しばらくしてから再度お試しください。"
        render :new
      end
    else
      flash[:danger] = "メールアドレスを見つかりませんでした。ご確認お願いします。"
      render :new
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      flash[:success] = "パスワードがリセットされました。ログインしてください。"
      redirect_to '/login'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def invalid_signature
    flash[:danger] = "URLの有効期限が切れています。もう一度リクエストお願いします。"
    redirect_to new_password_reset_path
  end
end
