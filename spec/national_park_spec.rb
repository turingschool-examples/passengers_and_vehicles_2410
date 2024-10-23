require './lib/passenger'
require './lib/vehicle'
require './lib/national_park'

RSpec describe NationalPark do
    before(:each) do
        @park = NationalPark.new("Shenandoah", 20)
        @vehicle1 = Vehicle.new("2001", "Honda", "Civic") 
        @vehicle2 = Vehicle.new("2007", "Hyundai", "Elantra")

        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20}) 
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
        @will = Passenger.new({"name" => "Will", "age" => 34})


    end



    describe "#initialization" do
      it "exists and has attributes"
        expect(@park).to be_a NationalPark



        
    end

    describe "#track_vehicles" do
        it "keeps a list of vehicles that have visited the park"
    end

    describe "#track_revenue" do 
      it "can track revenue"
      #adds visitors one by one based on if they are adult ($20), kids (under 18) are free
      #add to revenue/admission_collected

    end
end