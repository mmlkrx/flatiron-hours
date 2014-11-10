class CsvReader

  attr_accessor :days

  def initialize(file_path)
    self.days = []

    CSV.foreach(file_path, "r:ISO-8859-1") do |row|    
      self.days << row
    end

  end

end