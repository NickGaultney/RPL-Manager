class UsersController < ApplicationController
	skip_before_action :authorized, only: [:new, :create]

	def new	
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @printer.save
	   			session[:user_id] = @user.id
				format.html { redirect_to root_path, notice: 'Printer was successfully created.' }
				format.json { render :show, status: :created, location: @printer }
			else
				format.html { render :new }
				format.json { render json: @printer.errors, status: :unprocessable_entity }
			end
		end
	end

	private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
