class InquiryMailer < ApplicationMailer

	def inquiry_confirmation
    @inquiry = params[:inquiry]
    mail(
    	to: @inquiry.email, 
    	subject: 'Ihre Anfrage bei in-frieden.ch'
    	)
  end
	
  def admin_notification
  	@inquiry = params[:inquiry]
  	mail(
  		to: 'stephen.schuez@gmail.com',
  		subject: 'Neue Anfrage auf in-frieden.ch'
  		)
  end

end