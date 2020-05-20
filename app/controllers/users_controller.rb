class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy, :impersonate] 

	def index
		@users = policy_scope(User).order(created_at: :desc)
	end

	def show
	end

	# def edit
	# end

	# def update
	# 	if @user.update(user_params)
	# 		redirect_to user_path(@user),  notice: "Profil wurde angepasst"
	# 	else
	# 		render :edit
	# 	end 
	# end

	def destroy
    @user.destroy

    redirect_to root_path, notice: "Profil von #{@user.full_name} wurde gelöscht"
	end

	def impersonate
    impersonate_user(@user)
    redirect_to root_path
  end

  def stop_impersonating
  	authorize current_user
    stop_impersonating_user
    redirect_to users_path, notice: "Stopped impersonating"
  end

	private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo)
  end

  def set_user
  	@user = User.friendly.find(params[:id])
  	authorize @user
  end
end
