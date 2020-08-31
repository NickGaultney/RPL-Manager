module ApplicationHelper
	def alert_class(flash_type)
		case flash_type.to_sym
		when :notice
			"alert_success"
		when :alert
			"alert-warning"
		when :error
			"alert_danger"
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
