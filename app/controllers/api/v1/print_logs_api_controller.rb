class Api::V1::PrintLogsApiController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@print_logs = PrintLog.all
		render json: @print_logs
	end

	def show
	end

	def create
		@print_log = PrintLog.new(print_logs_params)
		if @print_log.save
			render json: @print_log
		else
			render error: { error: 'Unable to create Print Log.' }, status: 400
		end
	end

	def update
	end

	def destroy
	end

	private

	def print_log_params
		params.permit(:printer_id, :printer_name, :file_name, :filament_weight, :print_time, :cost, :status)
	end
end
