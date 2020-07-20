json.extract! print_log, :id, :printer_id, :file_name, :filament_weight, :print_time, :cost, :status, :boolean, :created_at, :updated_at
json.url print_log_url(print_log, format: :json)
