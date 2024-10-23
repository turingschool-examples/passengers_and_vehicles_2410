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
  end

  describe "#initialization" do 
    it "exists" do 
      # park 1
      expect(@park1).to be_a(Park)
      expect(@park1.name).to eq("Yosemite")
      expect(@park1.price).to eq(35)
      expect(@park1.vehicles).to eq([])

      # park 2
      expect(@park2).to be_a(Park)
      expect(@park2.name).to eq("Yellowstone")
      expect(@park2.price).to eq(30)
      expect(@park2.vehicles).to eq([])

      #park 3
      expect(@park3).to be_a(Park)
      expect(@park3.name).to eq("Grand Canyon")
      expect(@park3.price).to eq(40)
      expect(@park3.vehicles).to eq([])
    end
  end
end