class CsvReader

  attr_accessor :days, :converted_days

  def initialize(file_path)
    self.days = []
    self.converted_days = []

    CSV.foreach(file_path, "r:ISO-8859-1") do |row|    
      self.days << row
    end
  end

  def parse_days
    # input:
    # ["6/30/14", "8:15", "20:00", "210", "0"],
    # ["7/1/14", "8:15", "8:20", "120", "60"],
    days.collect do |day|
      converted_days << convert(day)
    end
  end

  def convert(day)
    day.collect do |e|
      if date?(e)
        DateTime.strptime("#{e}+0100", '%m/%d/%y%z')
      elsif time?(e)
        DateTime.strptime("#{insert_day(day, e)} #{e} +0100", '%m/%d/%y %H:%M %z')
      elsif minutes?(e)
        e.to_i
      else
        raise TypeError("Can't convert: #{e}")  
      end
    end
  end

  def insert_day(day, time)
    # determines whether it is the next day or same day 
    if (0..6).include? Time.parse(time).hour 
      increment_day(day)
    else
      day[0]
    end
  end

  def increment_day(day)
    month, day, year = day[0].scan(/\d+\/?/)
    day = day.to_i + 1
    "#{month}#{day}/#{year}"
  end

  def date?(str)
    # return value for scan: ["6/", "14/", "14"]
    str.scan(/\d+\/?/).length == 3
  end

  def time?(str)
    str.scan(/:/).length == 1
  end

  def minutes?(str)
    !time?(str)
  end

end