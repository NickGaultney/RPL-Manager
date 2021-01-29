class PrintLog < ApplicationRecord
  belongs_to :printer

  # Defined "each" method so that "total_cost" helper method
  # will work when a single PrintLog is passed instead
  # of a list of PrintLogs
  def each
  	yield(self)
  end

  def self.to_csv
  	header = %w[created_at printer_name file_name filament_weight print_time cost status]

  	CSV.generate(headers: true) do |csv|
  		csv << header

  		all.each do |log|
  			csv << log.attributes.values_at(*header)
  		end
  	end
  end
end
