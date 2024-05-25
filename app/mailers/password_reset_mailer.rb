class PasswordResetMailer < ApplicationMailer
  def reset(user)
    @user = user
    @token = @user.signed_id(purpose: "password_reset", expires_in: 15.minutes)
    mail(
      from: 'system@example.com',
      to: @user.email,
      bcc: ENV['ACTION_MAILER_USER'],
      subject: "パスワードリセット申請ありがとうございます"
    )
  end
end
