require 'yaml'

class LogCostCalculator
	attr_accessor :time, :weight

	def initialize(file, time=nil, weight=nil)
		@file = file
		@time = time
		@weight = weight
		@config = YAML.load(File.read(@file))
		
		@private_variables = self.instance_variables << :@private_variables << :@private_methods
		load_variables
		@private_methods = self.methods
		load_calculations
	end

	def get_config
		@config
	end

	def get_variables
		self.instance_variables - @private_variables
	end

	def get_methods
		self.methods - @private_methods
	end

	def set_values(time, weight)
		@time = time
		@weight = weight
	end

	def reload_config
		@config = YAML.load(File.read(@file))
		load_variables
		load_calculations
	end

	private
		def load_variables
			@config["variables"].each do |key, value|
				self.instance_variable_set(key, value)
				self.class.send(:attr_accessor, key.delete_prefix("@").to_sym)
			end
		end

		def load_calculations
			@config["calculations"].each do |key, value|
				self.define_singleton_method(key) {instance_eval value}
			end
		end
end