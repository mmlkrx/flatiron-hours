#require_relative 'spec_helper.rb'
require_relative '../study_time.rb'

describe "#total_time_studied" do
	array = ["8:00", "20:00", 120, 0]
	string = "Hey Bro, nice work, you've been hustling hours and min this week"


	it "should take an array with four elements as one parameter" do
		expect(total_time_studied()).to raise_error
		expect(array.length).to eq(4)
	end	

	it "should return an array with two numerical values" do
		expect(total_time_studied(array)).to eq([10,0])
	end

	it "should puts a formatted string" do
		expect($stdout).to receive(:puts).with(string)
	end
end


