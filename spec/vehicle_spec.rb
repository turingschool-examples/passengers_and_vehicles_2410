require './lib/vehicle'
require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vehicle do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    @jude = Passenger.new({"name" => "Jude", "age" => 20})    
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
  end

  describe "#initialization" do 
    it "exists" do 
      expect(@vehicle).to be_a Vehicle
      expect(@vehicle.year).to eq("2001")
      expect(@vehicle.make).to eq("Honda")
      expect(@vehicle.model).to eq("Civic")
      expect(@vehicle.passengers).to eq([])
    end
  end  

  describe "#speeding?" do
    it "can speed" do 
      expect(@vehicle.speeding?).to eq(false)
      @vehicle.speed
      expect(@vehicle.speeding?).to eq(true)
    end
  end

  describe "#num_adults" do
    it "can display number of adult passengers" do
      @vehicle.add_passenger(@charlie)    
      @vehicle.add_passenger(@jude)    
      @vehicle.add_passenger(@taylor)  
      @vehicle.passengers
      expect(@vehicle.num_adults).to eq(2)
    end
  end
end