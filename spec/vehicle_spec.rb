require 'rspec'
require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")

  end
  describe "initialize" do
    it "exits with attributes" do

      expect(@vehicle.year).to eq("2001")
      expect(@vehicle.make).to eq("Honda")
      expect(@vehicle.model).to eq("Civic")
    end
  end

  describe "speeding?/speed" do
    it "asks if the vehicle is speeding before and after speed" do
      expect(@vehicle.speeding?).to eq(false)
      @vehicle.speed
      expect(@vehicle.speeding?).to eq(true)
    end
  end
  describe "add_passenger" do
    it "adds a passenger to passengers array" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      @vehicle.add_passenger(charlie) 
      @vehicle.add_passenger(jude)
      @vehicle.add_passenger(taylor)

      expect(@vehicle.passengers).to be_an(Array)
      expect(@vehicle.passengers).to eq([charlie, jude, taylor])
    end
  end

  describe "num_adults" do
    it "tells how many adults in passengers array" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})
      @vehicle.add_passenger(charlie) 
      @vehicle.add_passenger(jude)
      @vehicle.add_passenger(taylor)

      expect(@vehicle.num_adults).to eq(2)
    end
  end
end