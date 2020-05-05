class ContactsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:new, :create]

  def index
		@contacts = policy_scope(Contact)
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		@contact = Contact.new
		authorize @contact
	end

	def create
		@contact = Contact.new(contact_params)
		authorize @contact
		
		if @contact.save
			mail = ContactMailer.with(contact: @contact).contact_confirmation
			mail.deliver_now

			mail_2 = ContactMailer.with(contact: @contact).admin_notification
			mail_2.deliver_now
			
			flash[:notice] = "Ihre Nachricht wurde erfolgreich übermittelt."
 			redirect_to root_path
		else
			render :new
		end	
	end

	private

	def contact_params
		params.require(:contact).permit(:email, :name, :content, :subject)
	end
end
