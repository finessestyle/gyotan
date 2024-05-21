class PasswordResetMailer < ApplicationMailer
  def reset
    @user = params[:user]
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)
    mail(
      from: 'system@example.com',
      to: @user.email,
      subject: 'パスワードリセットを受けつけました。'
    )
  end
end
