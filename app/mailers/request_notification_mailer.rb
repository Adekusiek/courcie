class RequestNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notify.subject
  #
  def request_notify(user, itineraries, request_count, latest_requests)

    @user = user
    @array = itineraries.zip(request_count, latest_requests)

    mail(to: @user.email, subject: "Requests that match to your on coming trip")
  end
end
