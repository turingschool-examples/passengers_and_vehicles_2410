require 'rspec'
require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe 'Passenger and Vehicles Spec Harness' do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe 'Iteration 1' do
    it '1. Passenger Instantiation' do
      expect(Passenger).to respond_to(:new).with(1).argument

      expect(@charlie).to be_a(Passenger)
      expect(@charlie).to respond_to(:name).with(0).argument
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie).to respond_to(:age).with(0).argument
      expect(@charlie.age).to eq(18)
    end

    it '2. Passenger #adult?' do
      expect(@charlie).to respond_to(:adult?).with(0).argument
      expect(@charlie.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)
    end

    it '3. Passenger #driver?' do
      expect(@charlie).to respond_to(:driver?).with(0).argument
      expect(@charlie.driver?).to eq(false)
    end

    it '4. Passenger #drive' do
      expect(@charlie).to respond_to(:drive).with(0).argument
      @charlie.drive
      expect(@charlie.driver?).to eq(true)
    end
  end

  describe 'Iteration 2' do
    it '5. Vehicle Instantiation' do
      expect(Vehicle).to respond_to(:new).with(3).argument

      expect(@vehicle).to be_a(Vehicle)
      expect(@vehicle.year).to eq("2001")
      expect(@vehicle.make).to eq("Honda")
      expect(@vehicle.model).to eq("Civic")
    end

    it '6. Vehicle #speeding?' do
      expect(@vehicle).to respond_to(:speeding?).with(0).argument
      expect(@vehicle.speeding?).to eq(false)
    end

    it '7. Vehicle #speed' do
      expect(@vehicle).to respond_to(:speed).with(0).argument
      @vehicle.speed
      expect(@vehicle.speeding?).to eq(true)
    end

    it '8. Vehicle #passengers' do
      expect(@vehicle).to respond_to(:passengers).with(0).argument
      expect(@vehicle.passengers).to eq([])
    end

    it '9. Vehicle #add_passenger' do
      expect(@vehicle).to respond_to(:add_passenger).with(1).argument
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      expect(@vehicle.passengers).to eq([@charlie, @taylor])
    end

    it '10. Vehicle #num_adults' do
      expect(@vehicle).to respond_to(:num_adults).with(0).argument
      jude = Passenger.new({"name" => "Jude", "age" => 20})

      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      @vehicle.add_passenger(jude)
      
      expect(@vehicle.num_adults).to eq(2)
    end
  end

describe 'Iteration 3' do
    it "11. Park Instantiation" do 
      expect(Park).to respond_to(:new).with(2).argument
      park = Park.new("RMNP", 25)
      expect(park.name).to eq("RMNP")
      expect(park.price).to eq(25)
    end

    it "12. Park #all_vehicles" do 
      park = Park.new("RMNP", 25)
      park.add_vehicle(@vehicle)
      expect(park.all_vehicles).to eq([@vehicle])
    end

    it "13. Park #all_passengers" do 
      park = Park.new("RMNP", 25)
      park.add_vehicle(@vehicle)
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      @vehicle.add_passenger(jude)
      park.add_vehicle(@vehicle)

      expect(park.all_passengers).to eq([@charlie, @taylor, jude])
    end

    it "14. Park #revenue" do 
      park = Park.new("RMNP", 25)
      park.add_vehicle(@vehicle)
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      @vehicle.add_passenger(jude)
      park.add_vehicle(@vehicle)

      expect(park.revenue).to eq(50)
    end
  end

  describe "Iteration 4" do 
    it "15. Park #all_passenger_names" do 
      park = Park.new("RMNP", 25)
      park.add_vehicle(@vehicle)
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      @vehicle.add_passenger(jude)
      park.add_vehicle(@vehicle)

      expect(park.all_passengers).to eq(["Charlie", "Jude", "Taylor"])
    end

    it "16. Park #minors" do 
      park = Park.new("RMNP", 25)
      park.add_vehicle(@vehicle)
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      @vehicle.add_passenger(jude)
      bob = Passenger.new({"name" => "Bob", "age" => 5})
      @vehicle.add_passenger(bob)
      park.add_vehicle(@vehicle)


      expect(park.minors).to eq("Bob", "Taylor")
    end

    it "17. Park #adults" do 
      park = Park.new("RMNP", 25)
      park.add_vehicle(@vehicle)
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@taylor)
      @vehicle.add_passenger(jude)
      bob = Passenger.new({"name" => "Bob", "age" => 35})
      @vehicle.add_passenger(bob)
      park.add_vehicle(@vehicle)


      expect(park.minors).to eq("Bob", "Charlie", "Jude")
    end
  end
end
