# Preview all emails at http://localhost:3000/rails/mailers/message_notification_mailer
class MessageNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_notification_mailer/message_notify
  def message_notify
    MessageNotificationMailer.message_notify
  end

end
