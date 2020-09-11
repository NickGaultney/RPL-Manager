class Api::V1::PrintersApiController < ApplicationController
	skip_before_action :verify_authenticity_token
	skip_before_action :authorized
	
	before_action :find_printer_by_name, only: [:show, :update, :destroy]

	def index
		@printers = Printer.all
		render json: @printers
	end

	def show
		render json: @printer
	end

	def create
		@printer = Printer.new(printer_params)
		if @printer.save
			render json: @printer
		else
			render error: { error: 'Unable to create Printer.' }, status: 400
		end
	end

	def update
		if @printer 
			@printer.update(printer_params)
			render json: { message: 'Printer successfully Updated!' }, status: 200
		else
			render json: { error: 'Unable to update Printer...' }, status: 400
		end
	end

	def destroy
		if @printer
			@printer.destroy
			render json: { message: 'Printer successfully Deleted!' }, status: 200
		else
			render json: { error: 'Unable to delete Printer...' }, status: 400
		end
	end

	private

	def find_printer_by_name
		@printer = Printer.find_by(name: params[:name])
	end

	def printer_params
		params.permit(:name, :status)
	end
end
