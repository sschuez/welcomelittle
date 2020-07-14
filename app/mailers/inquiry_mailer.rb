class InquiryMailer < ApplicationMailer

	def inquiry_confirmation
    @inquiry = params[:inquiry]
    mail(
    	to: @inquiry.email, 
    	subject: 'Your inquiry with welcomlittle.com'
    	)
  end
	
  def admin_notification
  	@inquiry = params[:inquiry]
  	mail(
  		to: 'stephen.schuez@gmail.com',
  		subject: 'Neue Anfrage auf welcomelittle.com'
  		)
  end

end