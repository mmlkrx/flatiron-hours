class Day

  attr_accessor :date, :start_time, :end_time, :pause_time, :home_study_time

  def self.new_from_array(array)
    self.new.tap do |s|
      s.date = array[0]
      s.start_time = array[1]
      s.end_time = array[2]
      s.pause_time = array[3]
      s.home_study_time = array[4]
    end
  end

	def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end