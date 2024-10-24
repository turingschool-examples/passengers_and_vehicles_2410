require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie).to be_a Passenger
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      expect(taylor).to be_a Passenger
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      expect(jude).to be_a Passenger
    end
  end

  describe "#adult?" do 
    it "returns true if the passenger is an adult" do 
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie.adult?).to eq true
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      expect(taylor.adult?).to eq false
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      expect(jude.adult?).to eq true
    end
  end

  describe "#driver?" do
   it "returns true if the passenger is a driver" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      expect(charlie.driver?).to eq true
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      expect(taylor.driver?).to eq false
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      expect(jude.driver?).to eq false
    end
  end
end