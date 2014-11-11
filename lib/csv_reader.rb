class CsvReader

  attr_accessor :days, :converted_days

  def initialize(file_path)
    self.days = []
    self.converted_days = []

    CSV.foreach(file_path, "r:ISO-8859-1") do |row|    
      self.days << row
    end

  end

  def export_days
    e_days = {}
    converted_days.each do |day|
      e_days["#{day[0]}"] = [day[1], day[2], day[3], day[4]]
    end
    e_days
  end

  def convert_all_days
     # ["6/30/14", "8:15", "20:00", "210", "0"],
     # ["7/1/14", "8:15", "8:20", "120", "60"],
     days.each do |day|
       converted_days << convert(day)
     end
  end

  def convert(day)
    day.collect do |e|
      if date?(e)
        # convert to date
      elsif time?(e)
        # convert to datetime
      elsif minutes?(e)
        e.to_i
      else
        raise TypeError("Can't convert: #{e}")  
      end
    end
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