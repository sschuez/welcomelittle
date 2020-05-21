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
		@user = current_user
		@memory.user = @user
		@memory.save

		redirect_to obituary_path(@obituary)
		flash[:notice] = "Neue Erinnerung für #{@obituary.full_name} erstellt."
	end

	def edit
		@obituary = Obituary.friendly.find(params[:friendly_id])
		
		@memory = Memory.find(params[:id])
		authorize @memory
		
	end

	def update
		@obituary = Obituary.friendly.find(params[:friendly_id])
		
		@memory = Memory.find(params[:id])
		authorize @memory
		

		if @memory.update(memory_params)
			redirect_to obituary_path(@obituary)
			flash[:notice] = "Erinnerung mit #{@obituary.full_name} wurde angepasst."
		else
			render :edit
		end
	end

	def destroy
		@obituary = Obituary.friendly.find(params[:friendly_id])
		
		@memory = Memory.find(params[:id])
		authorize @memory

		@memory.destroy
		redirect_to obituary_path(@obituary)
		flash[:notice] = "Erinnerung mit #{@obituary.full_name} wurde gelöscht"
	end

	private

	def set_memory
		
	end

	def memory_params
		params.require(:memory).permit(:description, :content)
	end

end
