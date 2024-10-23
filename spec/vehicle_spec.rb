require './lib/vehicle'
require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vehicle do
  describe '#initialization' do
    it 'exists' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle).to be_an_instance_of(Vehicle)
    end

    it 'has attributes' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.year).to eq('2001')
      expect(vehicle.make).to eq('Honda')
      expect(vehicle.model).to eq('Civic')
      expect(vehicle.passenders).to eq([])
    end
  end

  describe '#speeding?' do
    it 'returns false by default' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.speeding?).to be false
    end

    it 'true after #speed is called on the vehicle' do
      vehicle = Vehicle.new("2001", "Honda", "Civic")
      expect(vehicle.speeding?).to be false

      vehicle.speed

      expect(vehicle.speeding?).to be true
    end
  end

  describe '#add_passenger' do
    it 'adds a specific passenger to the list of passengers' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(vehicle.passengers).to eq([])

      vehicle.add_passenger(charlie)
      expect(vehicle.passengers).to eq([charlie])

      vehicle.add_passenger(jude)
      expect(vehicle.passengers).to eq([charlie, jude])

      vehicle.add_passenger(taylor)
      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end
  end

  describe '#num_adults' do
    it 'returns the number of adult passengers' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)

      expect(vehicle.num_adults).to eq(2)
    end
  end
end