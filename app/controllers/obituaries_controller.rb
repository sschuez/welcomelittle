class ObituariesController < ApplicationController
	def show
		@obituary = Obituary.friendly.find(params[:id])
		authorize @obituary
	end

	def index
		
	end

	private

	def obituary_params
		params.require(:obituary).permit(:first_name, :last_name, :residence, :death_date, :birth_date, :cause_of_death, :final_resting_place, :photo, :relation)
	end
end
