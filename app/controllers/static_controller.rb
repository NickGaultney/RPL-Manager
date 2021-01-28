class StaticController < ApplicationController
  def home
  	 @printers = Printer.order(:name).all
  	 @print_logs = PrintLog.order(helpers.sort_column => helpers.sort_direction).all
  end
end
