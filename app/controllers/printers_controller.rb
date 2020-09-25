class PrintersController < ApplicationController
  before_action :set_printer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  # GET /printers
  # GET /printers.json
  def index
    @printers = Printer.order(:name).all
  end

  # GET /printers/1
  # GET /printers/1.json
  def show
    @print_logs = PrintLog.where(printer_name: @printer.name)
  end

  # GET /printers/new
  def new
    @printer = Printer.new
  end

  # GET /printers/1/edit
  def edit
  end

  # POST /printers
  # POST /printers.json
  def create
    @printer = Printer.new(printer_params)

    respond_to do |format|
      if @printer.save
        broadcast
        redirect_to root_path
      else
        format.html { render :new }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printers/1
  # PATCH/PUT /printers/1.json
  def update
    respond_to do |format|
      if @printer.update(printer_params)
        broadcast
        redirect_to root_path
      else
        format.html { render :edit }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printers/1
  # DELETE /printers/1.json
  def destroy
    @printer.destroy
    broadcast
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printer
      @printer = Printer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def printer_params
      params.require(:printer).permit(:name, :status)
    end

    def broadcast
      ActionCable.server.broadcast "printers_channel"
    end
end
