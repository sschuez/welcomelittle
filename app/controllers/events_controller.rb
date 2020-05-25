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

end
