require 'rspec'
require './lib/passenger'
require './lib/vehicle'
require './lib/park_maker'

RSpec.describe ParkMaker do
  before(:each) do
    @park1 = ParkMaker.new("Yellowstone", 50)
  end

  describe "initialize" do
    it "exists with attributes" do
      expect(@park1.name).to eq("Yellowstone")
      expect(@park1.admission_price).to eq(50)
    end
  end

  describe "park_info" do
    it "displays park information" do
      expect(@park1.park_info).to be_a(String)
      expect(@park1.park_info).to eq("Park Name: Yellowstone Admission Price: $50")
    end
  end

  describe "add_vehicles" do
    it 'adds vehicles to vehicles array' do
      vehicle1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle2 = Vehicle.new("2008", "Lincoln", "MKX")
      vehicle3 = Vehicle.new("2011", "Audii", "A4")
      @park1.add_vehicle(vehicle1)
      @park1.add_vehicle(vehicle2)
      @park1.add_vehicle(vehicle3)

      expect(@park1.vehicles).to be_an(Array)
      expect(@park1.vehicles).to eq([vehicle1, vehicle2, vehicle3])
    end
  end

  describe "vehicles?" do
    it 'displays vehicles and their attributs' #I was in the middle of making and testing this method just to see results(i did not expect the code to work as is rn)
  end
end
