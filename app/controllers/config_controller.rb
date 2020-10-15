class ConfigController < ApplicationController
  def show
  	@config = helpers.get_config
  end

  def download
  	send_file File.join(Rails.root, 'public', 'config', 'log_cost_calculation.yml')
  end

  def upload
  	uploaded_io = params[:config_file]
    File.open(Rails.root.join('public', 'config', 'log_cost_calculation.yml'), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    redirect_to reload_config_path
  end

  def reload
  	helpers.reload_cost_config
    redirect_to print_logs_path
  end

  def edit
    
  end
end
