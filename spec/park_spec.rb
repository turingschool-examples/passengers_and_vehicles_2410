require './lib/passenger'
require './lib/vehicle'
require './lib/park'
require 'pry'

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
      expect(@park1.vehicles_list).to eq([])

      expect(@vehicle1).to be_a Vehicle

      expect(@charlie).to be_a Passenger
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie.age).to eq(18)
      @vehicle1.add_passenger(@charlie)    
      expect(@park1.entered_passengers)
    
      #park 2
      expect(@park2).to be_a(Park)
      expect(@park2.name).to eq("Yellowstone")
      expect(@park2.price).to eq(30)
      expect(@park2.vehicles_list).to eq([])

      expect(@vehicle1).to be_a Vehicle
      expect(@vehicle2).to be_a Vehicle

      expect(@charlie).to be_a Passenger
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie.age).to eq(18)
      @vehicle2.add_passenger(@charlie)    

      expect(@jude).to be_a Passenger
      expect(@jude.name).to eq("Jude")
      expect(@jude.age).to eq(20)
      @vehicle2.add_passenger(@jude)   
    
      #park 3
      expect(@park3).to be_a(Park)
      expect(@park3.name).to eq("Grand Canyon")
      expect(@park3.price).to eq(40)
      expect(@park3.vehicles_list).to eq([])

      expect(@vehicle1).to be_a Vehicle
      expect(@vehicle2).to be_a Vehicle
      expect(@vehicle3).to be_a Vehicle

      expect(@charlie).to be_a Passenger
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie.age).to eq(18)
      @vehicle3.add_passenger(@charlie)   

      expect(@jude).to be_a Passenger
      expect(@jude.name).to eq("Jude")
      expect(@jude.age).to eq(20)
      @vehicle3.add_passenger(@jude)   

      expect(@taylor).to be_a Passenger
      expect(@taylor.name).to eq("Taylor")
      expect(@taylor.age).to eq(12)
      @vehicle3.add_passenger(@taylor)   

    end
  end

  describe "#add_vehicle" do 
    it 'can add and list all the vehicles that entered the park' do
      #park 1 
      @park1.add_vehicle(@vehicle1)
      expect(@park1.entered_vehicles).to eq(@park1.vehicles_list)

      #park 2
      @park2.add_vehicle(@vehicle1)
      @park2.add_vehicle(@vehicle2)
      expect(@park2.entered_vehicles).to eq(@park2.vehicles_list)

      #park 3
      @park3.add_vehicle(@vehicle1)
      @park3.add_vehicle(@vehicle2)
      @park3.add_vehicle(@vehicle3)
      expect(@park3.entered_vehicles).to eq(@park3.vehicles_list)
    end
  end

  describe "#entered_passengers" do
    it 'can list all the passengers that entered the park' do

    end
  end
end