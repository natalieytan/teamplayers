class ApplicationMailer < ActionMailer::Base
  default from: "noreply@teamplayers.herokuapp.com"
  layout 'mailer'
end
