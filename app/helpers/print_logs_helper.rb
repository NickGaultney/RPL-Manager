module PrintLogsHelper
	# Loops through all the PrintLogs on a given page
	# and returns the sum of their costs
	# *** NOTE ***
	# This implementation could be more efficient if you 
	# increment sum in the views.
	def total_cost(print_logs)
		cost = 0
		print_logs.each do |log|
			cost += calculate_log_cost(log) unless log.status == 3
		end
		cost
	end
end