require './lib/vehicle'
require './lib/passenger'
require 'pry'
require 'rspec'

RSpec.describe Vehicle do 
  describe 'Vehicle' do
    before(:each) do 
      @vehicle = Vehicle.new("2001", "Honda", "Civic")  
    end

    describe 'initialize' do
      it 'initialize' do 
        expect(@vehicle.year).to eq("2001")
        expect(@vehicle.make).to eq("Honda")
        expect(@vehicle.model).to eq("Civic")
      end
    end

    describe 'speeding' do
      it 'checks to see if vehicle is speeding' do
        expect(@vehicle.speeding?).to be(true)
      end
    end

    describe 'passengers' do
      it 'has passengers array' do
        expect(@vehicle.passengers).to be_an(Array)
      end

      it 'has passengers' do
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})   
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
      end  

      it 'can add passengers' do
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})   
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

        @vehicle.add_passenger(@charlie) 
        @vehicle.add_passenger(@jude) 
        @vehicle.add_passenger(@taylor) 
        expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])  
      end

      it 'can check the number of adults' do
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})   
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
        
        expect(@vehicle.num_adults).to eq(2)
      end
    end
  end
end