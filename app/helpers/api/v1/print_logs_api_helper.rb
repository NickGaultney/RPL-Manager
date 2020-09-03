module Api::V1::PrintLogsApiHelper
	COST_OF_PRINTER = 3000
	COST_OF_FILAMENT = 23
	COST_OF_KWH = 0.1608
	TAZ_LIFE_EXPECTANCY = 4000		# Hours
	COST_OF_WORKER = 13
	TIME_PER_PART = 0.25			# Hours
	TAZ_HEAT_UP_USAGE = 0.36		# KWH
	TAZ_HEAT_UP_TIME = 0.25			# Hours
	TAZ_STABLE_USAGE = 0.16			# KWH

	def calculate_cost(weight, time)
		total_printer = (COST_OF_PRINTER / TAZ_LIFE_EXPECTANCY.to_f) * (time / 60.0)
		total_filament = (COST_OF_FILAMENT / (1000 / weight.to_f))
		total_worker = (COST_OF_WORKER / TIME_PER_PART)
		total_electrical = 
						((TAZ_HEAT_UP_USAGE * TAZ_HEAT_UP_TIME) + (TAZ_STABLE_USAGE * ((time * 60.0) - TAZ_HEAT_UP_TIME.to_f))) * COST_OF_KWH

		return total_printer + total_filament + total_worker + total_electrical
	end
end