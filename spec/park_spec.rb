require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Passenger do 
  before(:each) do
    @civic = Vehicle.new("2001", "Honda", "Civic")
    @impreza = Vehicle.new("2016", "Subaru", "Impreza")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @kim = Passenger.new({"name" => "Kim", "age" => 14})
    @alex = Passenger.new({"name" => "Alex", "age" => 34})
    @kerrin = Passenger.new({"name" => "Kerrin", "age" => 29})
    @andy = Passenger.new({"name" => "Andy", "age" => 31})

    @civic.add_passenger(@charlie)
    @civic.add_passenger(@jude)
    @civic.add_passenger(@taylor)
    @civic.add_passenger(@kim)

    @impreza.add_passenger(@alex)
    @impreza.add_passenger(@kerrin)
    @impreza.add_passenger(@andy)
  end

  describe "#initialization" do 
    it "exists" do 
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      expect(rocky_mountain).to be_a Park
    end

    it "has readable attributes" do
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      expect(rocky_mountain.name).to eq("Rocky Mountain National Park")
      expect(rocky_mountain.admission).to eq(30.00)
    end

    it "can have unique attributes" do
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      olympic = Park.new({"name" => "Olympic National Park", "admission" => 35.00})
      expect(olympic).to be_a Park
      expect(rocky_mountain).to_not eq(olympic)
    end
  end

  describe "#admit_vehicle" do
    it "has admitted_vehicles default to empty" do
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      expect(rocky_mountain.admitted_vehicles).to be_empty
    end

    it "can admit vehicles" do
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      expect(rocky_mountain.admitted_vehicles).to be_empty

      rocky_mountain.admit_vehicle(@civic)
      expect(rocky_mountain.admitted_vehicles).to eq([@civic])

      rocky_mountain.admit_vehicle(@impreza)
      expect(rocky_mountain.admitted_vehicles).to eq([@civic, @impreza])
    end
  end

  describe "#admitted_passengers" do
    it "has admitted passengers default to empty" do
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      expect(rocky_mountain.admitted_passengers).to be_empty
    end

    it "can add passengers from admitted vehicle" do
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      expect(rocky_mountain.admitted_passengers).to be_empty

      rocky_mountain.admit_vehicle(@civic)
      expect(rocky_mountain.admitted_passengers).to eq(["Charlie", "Jude", "Taylor", "Kim"])

      rocky_mountain.admit_vehicle(@impreza)
      expect(rocky_mountain.admitted_passengers).to eq(["Charlie", "Jude", "Taylor", "Kim", "Alex", "Kerrin", "Andy"])
    end
  end

  describe "#calculate_revenue" do
    it "has revenue default to 0.00" do
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      expect(rocky_mountain.revenue).to eq(0.00)
    end

    it "can calculate revenue with each admitted vehicle" do
      rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      expect(rocky_mountain).to eq(0.00)

      rocky_mountain.admit_vehicle(@civic)
      expect(rocky_mountain.revenue).to eq(30.00)

      rocky_mountain.admit_vehicle(@impreza)
      expect(rocky_mountain.revenue).to eq(60.00)
    end
  end
end