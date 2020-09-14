require 'securerandom'

class UsersController < ApplicationController
	skip_before_action :authorized, only: [:new, :create]

	def new	
		@user = User.new
	end

	def create
		@admin = User.first

		if @admin
			redirect_to root_path, alert: "Cannot create new user: Only one user can exist"
		else
			params[:api_key] = SecureRandom.hex(16)
			@user = User.new(user_params)
			respond_to do |format|
				if @user.save
		   			session[:user_id] = @user.id
					format.html { redirect_to root_path, notice: 'Printer was successfully created.' }
					format.json { render :show, status: :created, location: @user }
				else
					format.html { render :new }
					format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	def update
		respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'User was successfully updated.' }
	        format.json { render :show, status: :ok, location: @user }
	      else
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def api_key
		@user = User.find(session[:user_id])
	end

	def new_key

	end


	private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :api_key)
    end
end
