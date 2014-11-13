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

  def self.all
    @@all
  end

end