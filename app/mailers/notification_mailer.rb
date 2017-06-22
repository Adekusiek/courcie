class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notify.subject
  #
  def notify(user, itineraries, requests)

    @user = user
    @array = itineraries.zip(requests)

    mail(to: @user.email, subject: "Requests that match to your on coming trip")
  end
end
