require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie).to be_a Passenger
    end

    it "has a name" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie.name).to eq "Charlie"
    end

    it "has an age" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie.age).to eq 18
    end
  end 
end