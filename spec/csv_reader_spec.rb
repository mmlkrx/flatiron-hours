require_relative 'spec_helper'

describe CsvReader do

  let(:reader) {CsvReader.new("/Users/mm/Development/code/self/flatiron-hours/flatiron.csv")}

  describe '#parse_days' do
    it 'can parse days' do
      days = reader.parse_days
      expect(days.count).to eq(87)
    end
  end 
  
end