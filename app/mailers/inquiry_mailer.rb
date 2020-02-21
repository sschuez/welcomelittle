class InquiryMailer < ApplicationMailer

	def inquiry_confirmation
    @inquiry = params[:inquiry]
    mail(
    	to: @inquiry.email, 
    	subject: 'Ihre Anfrage bei in-frieden.ch',
    	bcc: 'stephen.schuez@gmail.com'
    	)
  end

end