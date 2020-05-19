class ObituariesController < ApplicationController
	
	def index
		@obituaries = Obituary.all

		skip_policy_scope
	end

	def new
		@obituary = Obituary.new
		skip_authorization
		@user = current_user
	end

	def create
		@obituary = Obituary.new(obituary_params)
		authorize @obituary
		@user = current_user
		@obituary.user = @user

		if @obituary.save
			redirect_to obituary_path(@obituary)
			flash[:notice] = "Traueranzeige für #{@obituary.full_name} wurde erstellt"
		else
			render :new
		end
	end

	def show
		@obituary = Obituary.friendly.find(params[:friendly_id])
		authorize @obituary
		@user = @obituary.user
	end

	def edit
		@obituary = Obituary.friendly.find(params[:friendly_id])
		authorize @obituary
		@user = @obituary.user
	end

	def update
		@obituary = Obituary.friendly.find(params[:friendly_id])
		authorize @obituary
		@user = @obituary.user

		if @obituary.update(obituary_params)
			redirect_to obituary_path(@obituary)
			flash[:notice] = "Traueranzeige für #{@obituary.full_name} wurde angepasst"
		else
			render :edit
		end
	end

	def destroy
		@obituary = Obituary.friendly.find(params[:friendly_id])
		authorize @obituary
		@user = @obituary.user

		@obituary.destroy
		redirect_to user_path(@user)
		flash[:notice] = "Traueranzeige für #{@obituary.full_name} wurde gelöscht"
	end


	private

	def obituary_params
		params.require(:obituary).permit(:first_name, :last_name, :residence, :death_date, :birth_date, :cause_of_death, :final_resting_place, :photo, :relation, :content)
	end
end
