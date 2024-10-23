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
      expect(rocky_mountain.revenue).to eq(0.00)

      rocky_mountain.admit_vehicle(@civic)
      expect(rocky_mountain.revenue).to eq(30.00)

      rocky_mountain.admit_vehicle(@impreza)
      expect(rocky_mountain.revenue).to eq(60.00)
    end
  end

  describe "#track_attendees" do
    before(:each) do
      @rocky_mountain = Park.new({"name" => "Rocky Mountain National Park", "admission" => 30.00})
      @civic.add_passenger(Passenger.new({"name" => "Mazie", "age" => 7}))
    end
    describe "#alphabetize" do
      it "has abc_attendees default to empty" do 
        expect(@rocky_mountain.abc_attendees).to be_empty
      end

      it "can add attendees to abc_attendees from admitted_passengers" do
        @rocky_mountain.admit_vehicle(@civic)
        @rocky_mountain.admit_vehicle(@impreza)
        expect(@rocky_mountain.abc_attendees.length).to eq(@rocky_mountain.admitted_passengers.length)
      end

      it "can alphabetize abc_attendees" do
        @rocky_mountain.admit_vehicle(@civic)
        
        expect(@rocky_mountain.abc_attendees).to eq(["Charlie", "Jude", "Kim", "Mazie", "Taylor"])

        @rocky_mountain.admit_vehicle(@impreza)
        expect(@rocky_mountain.abc_attendees).to eq(["Alex", "Andy", "Charlie", "Jude", "Kerrin", "Kim", "Mazie", "Taylor"])
      end
    end

    describe "#minor_attendees" do
      it "has minor_attendees default to empty" do
        expect(@rocky_mountain.minor_attendees).to be_empty
      end

      it 'can add all minors from admitted_passengers' do
        expect(@rocky_mountain.minor_attendees).to be_empty

        @rocky_mountain.admit_vehicle(@civic)
        @rocky_mountain.admit_vehicle(@impreza)

        expect(@rocky_mountain.minor_attendees.length).to eq(3)
      end

      it 'can alphabetize minor_attendees' do
        @rocky_mountain.admit_vehicle(@civic)
        @rocky_mountain.admit_vehicle(@impreza)

        expect(@rocky_mountain.minor_attendees).to eq(["Kim", "Mazie", "Taylor"])
      end
    end

    describe "#adult_attendees" do
      it "has adult_attendees dafault to empty" do
        expect(@rocky_mountain.adult_attendees).to be_empty
      end

      it "can add all adults from admitted_passengers" do
        expect(@rocky_mountain.minor_attendees).to be_empty

        @rocky_mountain.admit_vehicle(@civic)
        @rocky_mountain.admit_vehicle(@impreza)

        expect(@rocky_mountain.adult_attendees.length).to eq(5)
      end

      it "can alphabetize adult_attendees" do
        @rocky_mountain.admit_vehicle(@civic)
        expect(@rocky_mountain.adult_attendees).to eq(["Charlie", "Jude"])

        @rocky_mountain.admit_vehicle(@impreza)
        expect(@rocky_mountain.adult_attendees).to eq(["Alex", "Andy", "Charlie", "Jude", "Kerrin"])
      end
    end
  end
end