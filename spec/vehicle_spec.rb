require './lib/vehicle'
require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vehicle do
  before(:each) do
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
        expect(@vehicle.num_adults).to eq(2)
    end
  end
end