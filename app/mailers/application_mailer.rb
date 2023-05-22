class ApplicationMailer < ActionMailer::Base
  default from: EVN['SMTP_USERNAME']
  layout "mailer"
end
