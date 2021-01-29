require 'csv'

class PrintLogsController < ApplicationController
  before_action :set_print_log, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  # GET /print_logs
  # GET /print_logs.json
  def index
    @print_logs = PrintLog.order(helpers.sort_column => helpers.sort_direction).all
    respond_to do |format|
      format.html
      format.csv {send_data @print_logs.to_csv}
    end
  end

  # GET /print_logs/1
  # GET /print_logs/1.json
  def show
  end

  # GET /print_logs/new
  def new
    @print_log = PrintLog.new
  end

  # GET /print_logs/1/edit
  def edit
  end

  # POST /print_logs
  # POST /print_logs.json
  def create
    params[:print_log][:printer_id] = Printer.find_by(name: form_fields(:printer_name)).id
    @print_log = PrintLog.new(print_log_params)

    respond_to do |format|
      if @print_log.save
        format.html { redirect_to @print_log, notice: 'Print log was successfully created.' }
        format.json { render :show, status: :created, location: @print_log }
      else
        format.html { render :new }
        format.json { render json: @print_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_logs/1
  # PATCH/PUT /print_logs/1.json
  def update
    respond_to do |format|
      if @print_log.update(print_log_params)
        format.html { redirect_to @print_log, notice: 'Print log was successfully updated.' }
        format.json { render :show, status: :ok, location: @print_log }
      else
        format.html { render :edit }
        format.json { render json: @print_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_logs/1
  # DELETE /print_logs/1.json
  def destroy
    @print_log.destroy
    respond_to do |format|
      format.html { redirect_to print_logs_path, notice: 'Print log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reset_print_logs
    PrintLog.destroy_all
    respond_to do |format|
      format.html { redirect_to print_logs_path, notice: 'Print logs were successfully destroyed.' }
      format.json { head :no_content }
    end
  end   

  private
    # Use callbacks to share common setup or constraints between actions.
    def form_fields(key)
      params[:print_log][key]
    end

    def set_print_log
      @print_log = PrintLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def print_log_params
      params.require(:print_log).permit(:printer_id, :printer_name, :file_name, :filament_weight, :print_time, :cost, :status)
    end
end
