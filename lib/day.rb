class Day

  attr_accessor :start_time, :end_time, :pause_time, :home_study_time
  # should initialize with hash
	def initialize(day_string)
    @start_time = day_string[1]
    @end_time = day_string[2]
    @pause_time = day_string[3]
    @home_study_time = day_string[4]
  end

end