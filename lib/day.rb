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

  def self.total_flatiron_minutes
    result = all.inject(0) do |sum, day|
      sum + day.flatiron_minutes
    end
    result
  end

  def self.total_study_time
    total_flatiron_minutes - total_break_minutes + total_home_study_minutes
  end

  def self.total_break_minutes
    result = all.inject(0) do |sum, day|
      sum + day.pause_time
    end
    result
  end

  def self.total_home_study_minutes
    result = all.inject(0) do |sum, day|
      sum + day.home_study_time
    end
    result
  end

  def self.average_flatiron_minutes
    total_flatiron_minutes / all.count
  end

  def self.average_break_minutes
    total_break_minutes / all.count
  end

  def self.average_home_study_minutes
    total_home_study_minutes / all.count
  end

  def self.find_longest_day
    result = all.first
    all.each do |day|
      result = day if day.flatiron_minutes > result.flatiron_minutes
    end
    result
  end

  def self.average_work_minutes
    average_flatiron_minutes + average_home_study_minutes - average_break_minutes
  end

  def self.find_by_date(date)
    d = DateTime.parse("#{date}T00:00+01:00")
    result = 0
    Day.all.each do |day|
      if d.to_s == day.date.to_s
        result = day
      end
    end
    result
  end

  def self.all
    @@all
  end

  def self.print_information
    avrg = format_minutes(average_flatiron_minutes)
    work = format_minutes(average_flatiron_minutes - average_break_minutes)
    puts "Your average daily time on campus was #{avrg} hours."
    puts "Of those #{avrg} hours, you spend #{work} hours studying."
    puts "When you came home, you spend another #{average_home_study_minutes} minutes studying.\n\n"
    puts "The total time spend in school during #{all.count} days was #{total_flatiron_minutes / 60} hours."
    puts "The total time spend studying was #{total_study_time / 60} hours.\n\n"
    puts "Good job!"
  end

  def print_information
    puts "On #{date.strftime("%B #{date.day.ordinalize}")} you've spend #{Day::format_minutes(flatiron_minutes)} hours on campus."
    puts "The time spend on break or playing Pillarball was #{self.class.format_minutes(pause_time)} hours."
    puts "When you got home you spend another #{Day::format_minutes(home_study_time)} hours studying." if home_study_time > 0
    puts "Your total study time was #{self.class.format_minutes(work_minutes)} hours."
  end

  def flatiron_minutes
    (end_time.to_time - start_time.to_time).to_i / 60
  end

  def work_minutes
    flatiron_minutes + home_study_time - pause_time
  end

  def self.format_minutes(minutes)
    hours = minutes / 60
    minutes = minutes % 60

    if hours < 10 && minutes < 10
      "0#{hours}:0#{minutes}"
    elsif hours < 10 && minutes > 9
      "0#{hours}:#{minutes}"
    elsif hours > 9 && minutes > 9 
      "#{hours}:#{minutes}"
    else
      "#{hours}:0#{minutes}"
    end
  end

end