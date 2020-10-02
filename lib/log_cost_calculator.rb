require 'yaml'

class LogCostCalculator
	attr_accessor :time, :weight

	def initialize(file, time=nil, weight=nil)
		@file = file
		@config = YAML.load(File.read(file))
		@time = time
		@weight = weight

		load_variables
		load_calculations
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
			@config[:variables].each do |key, value|
				self.instance_variable_set("@#{key}", value)
			end
		end

		def load_calculations
			@config[:calculations].each do |key, value|
				self.define_singleton_method(key.to_sym) {instance_eval value}
			end
		end
end