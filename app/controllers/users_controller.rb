class UsersController < ApplicationController
	skip_before_action :authorized, only: [:new, :create]
	
	def new
		@user = User.create(user_params)
   		session[:user_id] = @user.id
   		redirect_to root_path
	end

	def create
	end

	private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
