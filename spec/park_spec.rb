require './lib/park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do
    describe '#initialization' do
        it 'exists' do
            park1 = Park.new('Shenandoah', 20)
            
            expect(park1).to be_a Park
        end
        
        it 'has a name and lists admission price per adult' do
            park1 = Park.new('Shenandoah', 20)

            expect(park1.name).to eq('Shenandoah')
            expect(park1.admission).to eq(20)
            
        end
  
        it 'can contain a list of vehicles entered' do
            park1 = Park.new('Shenandoah', 20)

            expect(park1.vehicles).to eq([])
        end

        it 'can contain a list of visitors admitted' do
            park1 = Park.new('Shenandoah', 20)

            expect(park1.visitors).to eq([])
        end

    end

    describe 'entry' do

        it 'can add vehicles' do
            park1 = Park.new('Shenandoah', 20)
            vehicle = Vehicle.new("2001", "Honda", "Civic")  
        
            park1.admit_vehicle(vehicle)

            expect(park1.vehicles).to eq([vehicle])
        end

        xit 'can add visitors from vehicle passenger array' do
            park1 = Park.new('Shenandoah', 20)
            vehicle = Vehicle.new("2001", "Honda", "Civic") 
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})

            vehicle.add_passenger(charlie)

            park1.admit_passengers(vehicle)

            expect(park1.visitors).not_to be_empty
        end


        it 'can generate total revenue collected from admission charged' do
            park1 = Park.new('Shenandoah', 20)
        
            expect(park1.admission_collected).to eq(0)
        end
    end
end

