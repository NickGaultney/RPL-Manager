module PrintLogsHelper
	# Loops through all the PrintLogs on a given page
	# and returns the sum of their costs
	def total_cost(print_logs)
		cost = 0
		print_logs.each do |log|
			cost += log.cost unless log.status == 3
		end
		cost
	end
end