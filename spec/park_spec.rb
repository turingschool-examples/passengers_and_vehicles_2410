require './lib/passenger'
require './lib/vehicle'
require './lib/park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do 
  before(:each) do
    @park1 = Park.new("Yosemite", 35)
    @park2 = Park.new("Yellowstone", 30)
    @park3 = Park.new("Grand Canyon", 40)
    
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    @jude = Passenger.new({"name" => "Jude", "age" => 20})    
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle2 = Vehicle.new("2015", "Ford", "Explorer")
    @vehicle3 = Vehicle.new("2020", "Tesla", "Model S")
end

  describe "#initialization" do 
    it "exists" do 
      #park 1
      expect(@park1).to be_a(Park)
      expect(@park1.name).to eq("Yosemite")
      expect(@park1.price).to eq(35)
      expect(@park1.vehicles).to eq([])
      @park1.add_vehicle(@vehicle1)
      expect(@park1.entered_vehicles).to eq(@park1.vehicles)
      
      #park 2
      expect(@park2).to be_a(Park)
      expect(@park2.name).to eq("Yellowstone")
      expect(@park2.price).to eq(30)
      expect(@park2.vehicles).to eq([])
      @park1.add_vehicle(@vehicle1)
      @park1.add_vehicle(@vehicle2)
      expect(@park2.entered_vehicles).to eq(@park2.vehicles)

      #park 3
      expect(@park3).to be_a(Park)
      expect(@park3.name).to eq("Grand Canyon")
      expect(@park3.price).to eq(40)
      expect(@park3.vehicles).to eq([])
      @park1.add_vehicle(@vehicle1)
      @park1.add_vehicle(@vehicle2)
      @park1.add_vehicle(@vehicle3)
      expect(@park3.entered_vehicles).to eq(@park3.vehicles)

    end
  end
end