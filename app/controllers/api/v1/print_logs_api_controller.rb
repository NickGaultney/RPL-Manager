class Api::V1::PrintLogsApiController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :find_log_by_id, only: [:update]

	def index
		@print_logs = PrintLog.all
		render json: @print_logs
	end

	def show
	end

	def create
		params[:printer_id] = find_printer_by_name.id
		convert_time_to_minutes
		convert_weight_to_grams
		params[:cost] = helpers.calculate_cost(params[:filament_weight], params[:print_time])

		@print_log = PrintLog.new(print_log_params)
		if @print_log.save
			render json: @print_log
		else
			render error: { error: 'Unable to create Print Log.' }, status: 400
		end
	end

	def update
		if @print_log 
			@print_log.update(print_log_params)
			render json: { message: 'Printer successfully Updated!' }, status: 200
		else
			render json: { error: 'Unable to update Printer...' }, status: 400
		end
	end

	def destroy
	end

	private

	def find_printer_by_name
		@printer = Printer.find_by(name: params[:printer_name])
	end

	def find_log_by_id
		@print_log = PrintLog.find(params[:id])
	end

	def print_log_params
		params.permit(:printer_id, :printer_name, :file_name, :filament_weight, :print_time, :cost, :status)
	end

	def convert_time_to_minutes
		minutes = 0
		time = params[:print_time].split(/[\sa-zA-Z\s]+/)

		# Convert hours to minutes
		minutes += time[0].to_i * 60

		# Add minutes
		minutes += time[1].to_i

		params[:print_time] = minutes.to_f
	end

	def convert_weight_to_grams
		grams = params[:filament_weight].match(/\d+\.?\d*/)[0].to_f
		params[:filament_weight] = grams
	end
end
