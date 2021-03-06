class MessageNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_notification_mailer.message_notify.subject
  #
  def message_notify(message)
    @user_from = message.user_from
    @user_to   = message.user_to
    @message   = message

    mail(from: '"Courcie" <no-reply-notification@courcie.com>', reply_to: 'feedback@courcie.com', to: @user_to.email, subject: "You got a new message!")
  end
end
