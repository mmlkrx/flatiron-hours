class CsvReader

  attr_accessor :days

  def initialize(file_path)
    self.days = []

    CSV.foreach(file_path, "r:ISO-8859-1") do |row|    
      self.days << row
    end

  end

  def convert_datetime
     # ["6/30/14", "8:15", "20:00", "210", "0"],
     # ["7/1/14", "8:15", "8:20", "120", "60"],
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