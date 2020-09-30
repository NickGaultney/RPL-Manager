class PrintLog < ApplicationRecord
  belongs_to :printer

  # Defined "each" method so that "total_cost" helper method
  # will work when a single PrintLog is passed instead
  # of a list of PrintLogs
  def each
  	yield(self)
  end
end
