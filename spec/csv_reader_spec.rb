require_relative 'spec_helper'

describe CsvReader do

  let(:reader) {CsvReader.new("/Users/mm/Development/code/self/flatiron-hours/flatiron.csv")}

  describe '#parse_days' do
    it 'can parse days' do
      reader.parse_days
      expect(reader.converted_days.count).to eq(87)
    end
  end 

  describe '#export_days' do
    it 'exports a hash with datetime objects as keys' do
      days = reader.export_days
      expect(days.keys.first).to respond_to(:to_date, :to_time)
    end
  end
  
end