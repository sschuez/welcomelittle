class EventsController < ApplicationController

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

	def new
		@obituary = Obituary.friendly.find(params[:friendly_id])
		@event = Event.new
		authorize @event
	end

	

	private

	def event_params
		
	end

	def set_event
		
	end

end
