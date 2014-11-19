require_relative 'spec_helper'

describe Day do

  let(:reader) {CsvReader.new("/Users/mm/Development/code/self/flatiron-hours/flatiron.csv")}
  let(:days_array) { reader.parse_days }
  let(:day1) { Day.new_from_array(days_array[10]) }
  let(:day2) { Day.new_from_array(days_array[50]) }
  let(:day3) { Day.new_from_array(days_array[72]) }

  describe '#print_information' do
    it 'puts the average daily hours on campus' do
      STDOUT.should_receive(:puts).with("On June 12th you've spend 09:25 hours on campus.")
      STDOUT.should_receive(:puts).with("The time spend on break or playing Pillarball was 01:00 hours.")
      STDOUT.should_receive(:puts).with("When you got home you spend another 00:20 hours studying.")
      STDOUT.should_receive(:puts).with("Your total study time was 08:45 hours.")
      day1.print_information
    end
  end
end