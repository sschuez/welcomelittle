class ObituariesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show, :welcome]
	before_action :set_obituary, only: [:show, :edit, :update, :destroy, :text, :destroy_text]
	
	def index
		if params[:query].present?
      sql_query = " \
        obituaries.first_name ILIKE :query \
        OR obituaries.last_name ILIKE :query \
        OR obituaries.residence ILIKE :query \
        OR users.first_name ILIKE :query \
        OR users.last_name ILIKE :query \
      "
      @obituaries = Obituary.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @obituaries = Obituary.all
    end
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
		@markers = @obituary.events.map do |event|
		  {
		    lat: event.latitude,
		    lng: event.longitude,
		    infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
		    id: event.id
		  }
		end
	end

	def edit
	end

	def update
		if @obituary.update(obituary_params)
			redirect_to obituary_path(@obituary)
			flash[:notice] = "Traueranzeige von #{@obituary.full_name} wurde angepasst"
		else
			render :edit
		end
	end

	def destroy
		@obituary.destroy
		redirect_to user_path(@user)
		flash[:notice] = "Traueranzeige für #{@obituary.full_name} wurde gelöscht"
	end

	def welcome
		skip_authorization
	end

	def text
	end

	def destroy_text
		@obituary.content = ''
		@obituary.save
		redirect_to obituary_path(@obituary)
		flash[:notice] = "Text von #{@obituary.full_name}s Traueranzeige wurde entfernt"
	end


	private

	def set_obituary
		@obituary = Obituary.friendly.find(params[:friendly_id])
		authorize @obituary
		@user = @obituary.user
	end

	def obituary_params
		params.require(:obituary).permit(:first_name, :last_name, :residence, :death_date, :birth_date, :cause_of_death, :final_resting_place, :photo, :relation, :content)
	end
end
