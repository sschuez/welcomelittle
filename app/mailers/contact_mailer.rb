class ContactMailer < ApplicationMailer

	def contact_confirmation
    @contact = params[:contact]
    mail(
    	to: @contact.email, 
    	subject: 'Your message to welcomlittle.com'
    	)
  end
	
  def admin_notification
  	@contact = params[:contact]
  	mail(
  		to: 'stephen.schuez@gmail.com',
  		subject: 'Neue Nachricht an welcomelittle.com'
  		)
  end

end