module ApplicationHelper
	def alert_class(flash_type)
		case flash_type.to_sym
			when :notice then "alert alert-info"
	        when :success then "alert alert-success"
	        when :error then "alert alert-error"
	        when :alert then "alert alert-error"
    	end
	end

	def colorize(status)
		case status
		when 0
			"text-success"
		when 1
			"text-warning"
		when 2
			"text-info"
		when 3
			"text-danger"
		end
	end
end
