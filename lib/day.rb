class Day

  attr_accessor :date, :start_time, :end_time, :pause_time, :home_study_time
  @@all = []

	def initialize
    @@all << self
  end

  def self.new_from_array(array)
    self.new.tap do |d|
      d.date = array[0]
      d.start_time = array[1]
      d.end_time = array[2]
      d.pause_time = array[3]
      d.home_study_time = array[4]
    end
  end

  def self.average_flatiron_minutes
    result = all.inject(0) do |sum, day|
      sum + day.flatiron_minutes
    end
    result / all.count
  end

  def self.average_break_minutes
    result = all.inject(0) do |sum, day|
      sum + day.pause_time
    end
    result / all.count
  end

  def self.average_home_study_minutes
    result = all.inject(0) do |sum, day|
      sum + day.home_study_time
    end
    result / all.count
  end

  def self.average_work_minutes
    average_flatiron_minutes + average_home_study_minutes - average_break_minutes
  end

  def self.all
    @@all
  end

  def flatiron_minutes
    (end_time.to_time - start_time.to_time) / 60.0
  end

end