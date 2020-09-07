class Printer < ApplicationRecord
	validates_uniqueness_of :name
	has_many :print_logs
end