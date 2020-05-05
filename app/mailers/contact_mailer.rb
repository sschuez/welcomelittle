class ContactMailer < ApplicationMailer

	def contact_confirmation
    @contact = params[:contact]
    mail(
    	to: @contact.email, 
    	subject: 'Ihre Nachricht an in-frieden.ch'
    	)
  end
	
  def admin_notification
  	@contact = params[:contact]
  	mail(
  		to: 'stephen.schuez@gmail.com',
  		subject: 'Neue Nachricht an in-frieden.ch'
  		)
  end

end