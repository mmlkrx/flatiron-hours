require_relative 'spec_helper'

describe Day do

  let(:reader) {CsvReader.new("/Users/mm/Development/code/self/flatiron-hours/flatiron.csv")}
  let(:days_array) { reader.parse_days }

  before(:each) do
    Day.all.clear
    @day1 = Day.new_from_array(days_array[10])
    @day2 = Day.new_from_array(days_array[50])
    @day3 = Day.new_from_array(days_array[72])
  end

  describe '#print_information' do
    it 'puts all basic information for a day' do
      STDOUT.should_receive(:puts).with("On June 12th you've spend 09:25 hours on campus.")
      STDOUT.should_receive(:puts).with("The time spend on break or playing Pillarball was 01:00 hours.")
      STDOUT.should_receive(:puts).with("When you got home you spend another 00:20 hours studying.")
      STDOUT.should_receive(:puts).with("Your total study time was 08:45 hours.")
      @day1.print_information
    end
  end

  describe '.print_information' do
    it 'puts all basic information for a range of days' do
      STDOUT.should_receive(:puts).with("Your average daily time on campus was 11:33 hours.")
      STDOUT.should_receive(:puts).with("Of those 11:33 hours, you spend 10:03 hours studying.")
      STDOUT.should_receive(:puts).with("When you came home, you spend another 23 minutes studying.\n\n")
      STDOUT.should_receive(:puts).with("The total time spend in school during 3 days was 34 hours.")
      STDOUT.should_receive(:puts).with("The total time spend studying was 31 hours.\n\n")
      STDOUT.should_receive(:puts).with("Good job!")
      Day.print_information
    end
  end
end