class MemoriesController < ApplicationController

	def new
		@memory = Memory.new
		authorize @memory
	end

end
