class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmation.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view

    mail(to: @user.email, subject: "Willkommen bei in-frieden.ch")
    # This will render a view in `app/views/user_mailer`!
  end
end


# class UserMailer < ApplicationMailer
#   def welcome
#     @user = params[:user] # Instance variable => available in view
#     mail(to: @user.email, subject: 'Welcome to Le Wagon')
#     # This will render a view in `app/views/user_mailer`!
#   end
# end