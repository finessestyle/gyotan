class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      to: ENV['ACTION_MAILER_USER'],
      subject: "お問い合わせについて【自動送信】"
    )
  end
end
