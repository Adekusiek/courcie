class ApplicationMailer < ActionMailer::Base
  default from: 'notification-no-reply@courcie.com'
  layout 'mailer'
end
