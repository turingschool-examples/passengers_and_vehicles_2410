require './lib/vehicle'
require './lib/passenger'

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle).to be_a Vehicle
    end

    it "has readable attributes" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.year).to eq(2001)
      expect(vehicle.make).to eq("Honda")
      expect(vehicle.model).to eq("Civic")
    end
  end

  describe "#speeding/speed" do
    it 'can have vehicle speeding default as false' do 
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.speeding?).to eq false
    end

    it 'can speed' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.speeding?).to eq false

      vehicle.speed
      expect(vehicle.speeding?).to eq true
    end
  end

  describe "#add_passengers" do 
    before(:each) do
      @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
      @jude = Passenger.new({"name" => "Jude", "age" => 20})
      @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    end

    it 'has passengers default to empty' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.passengers).to be_empty
    end

    it 'can add passengers' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.passengers).to be_empty

      vehicle.add_passenger(@charlie)
      vehicle.add_passenger(@jude)
      vehicle.add_passenger(@taylor)
      
      expect(vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end

    it 'can count number of adults passengers' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      vehicle.add_passenger(@charlie)
      vehicle.add_passenger(@jude)
      vehicle.add_passenger(@taylor)

      expect(vehicle.num_adults).to eq(2)
    end
  end
end