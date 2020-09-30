module ApplicationHelper
	def alert_class(flash_type)
		case flash_type.to_sym
			when :notice then "alert alert-info"
	        when :success then "alert alert-success"
	        when :error then "alert alert-danger"
	        when :alert then "alert alert-danger"
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

	def sortable(column, title = nil)
	  title ||= column.titleize
	  #css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => "btn btn-default text-light"}
	end

	def sort_column
      PrintLog.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
