class TeamMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.team_mailer.confirmation.subject
  #
  def confirmation(team, user)
    @team = team
    @name = user.profile.full_name
    default from: "noreply@teamplayers.herokuapp.com"
    mail to: user.email, subject: "Team created"
  end
end
