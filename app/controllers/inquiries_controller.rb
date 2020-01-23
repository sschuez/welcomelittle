class InquiriesController < ApplicationController
	def index
		@inquiries = Inquiry.all
	end

	def show
		@inquiry = Inquiry.find(params[:id])
	end

	def new
		@inquiry = Inquiry.new
	end

	def create
		@inquiry = Inquiry.new(inquiry_params)
		@inquiry.save

		redirect_to inquiry_path(@inquiry)
	end

	def edit
		@inquiry = Inquiry.find(params[:id])
	end

	def update
		@inquiry = Inquiry.find(params[:id])
		@inquiry.update(params[:inquiry])
	end

	def destroy
    @inquiry = inquiry.find(params[:id])
    @inquiry.destroy

    redirect_to inquiries_path
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:email, :newspaper, :other_newspaper, :desired_date)
  end
end