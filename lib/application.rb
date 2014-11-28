class App

  def self.start
    puts "Hi, please put in the path to your CSV file."
    csv = gets.strip
    load_file(csv)
    info
    input = ""

    until input == "exit"
      input = gets.strip
      if input == "info"
        info
      elsif input == "1"
        puts "Which date are you looking to get information for?"
        date = gets.strip
        day_information(date)
      elsif input == "2"
        Day.print_information
      end
    end

  end

  def self.day_information(date)
    Day.find_by_date(date).print_information
  end

  def self.info
    puts "These are the things you can do."
    puts "Unless you type 'exit' or 'info', type numbers:"
    puts "1: Input a date to get specific information (JJJJ-MM-DD)."
    puts "2: Get average information over the whole time period."
  end

  def self.load_file(file_path)
    reader = CsvReader.new(file_path)
    days_array = reader.parse_days
    days_array.each{|d| Day.new_from_array(d)}
  end

end