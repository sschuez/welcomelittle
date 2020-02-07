class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Wilkommen bei in-frieden.ch')
    # This will render a view in `app/views/user_mailer`!
  end

  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'stephen.schuez@gmail.com',
      :from => 'info@in-frieden.ch',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end