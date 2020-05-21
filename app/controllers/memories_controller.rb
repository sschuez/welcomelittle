class MemoriesController < ApplicationController

	def new
		@obituary = Obituary.friendly.find(params[:friendly_id])
		@memory = Memory.new
		authorize @memory
	end

	def create
		@memory = Memory.new(memory_params)
		authorize @memory
		@obituary = Obituary.friendly.find(params[:friendly_id])
		@memory.obituary = @obituary
		@memory.save

		redirect_to obituary_path(@obituary)
		flash[:notice] = "Neue Erinnerung von #{@obituary.full_name} erstellt."
	end

	private

	def set_memory
		
	end

	def memory_params
		params.require(:memory).permit(:description)
	end

end
