class EventsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]

	def index
	  @events = policy_scope(Event).geocoded # returns events with coordinates
	  skip_authorization

	  @markers = @events.map do |event|
	    {
	      lat: event.latitude,
	      lng: event.longitude,
	      infoWindow: render_to_string(partial: "info_window", locals: { event: event })
	    }
	  end
	end

	def show
		@obituary = Obituary.friendly.find(params[:friendly_id])
		@event = Event.find(params[:id])
  	authorize @event

  	@markers = [{
  		      lat: @event.latitude,
  		      lng: @event.longitude,
  		      infoWindow: render_to_string(partial: "info_window", locals: { event: @event })
  		    }]
	end

	def new
		@obituary = Obituary.friendly.find(params[:friendly_id])
		@event = Event.new
		authorize @event
	end

	def create
		@event = Event.new(event_params)
		authorize @event

		@obituary = Obituary.friendly.find(params[:friendly_id])
		@event.obituary = @obituary
		
		@event.save

		redirect_to obituary_path(@obituary)
		flash[:notice] = "Neu Veranstaltung für #{@obituary.full_name} erstellt"
	end

	def edit
		@obituary = Obituary.friendly.find(params[:friendly_id])
		
		@event = Event.find(params[:id])
		authorize @event
	end

	def update
		@obituary = Obituary.friendly.find(params[:friendly_id])
		
		@event = Event.find(params[:id])
		authorize @event
		

		if @event.update(event_params)
			redirect_to obituary_path(@obituary)
			flash[:notice] = "Veranstaltung für #{@obituary.full_name} wurde angepasst."
		else
			render :edit
		end
	end

	def destroy
		@obituary = Obituary.friendly.find(params[:friendly_id])
		
		@event = Event.find(params[:id])
		authorize @event

		@event.destroy
		redirect_to obituary_path(@obituary)
		flash[:notice] = "Veranstaltung #{@event.name} wurde gelöscht"
	end

	private

	def event_params
		params.require(:event).permit(:name, :address, :content, :date, :time)
	end

	def set_event
		
	end

end
