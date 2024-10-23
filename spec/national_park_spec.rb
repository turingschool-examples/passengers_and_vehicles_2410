require './lib/vehicle'
require './lib/passenger'
require './lib/national_park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe NationalPark do
  describe '#intialization' do
    it 'exists' do
      park = NationalPark.new({name: 'Acadia', admission: 30})
      expect(park).to be_an_instance_of(NationalPark)
    end

    it 'has attributes' do
      park = NationalPark.new({name: 'Acadia', admission: 30})
      expect(park.name).to eq('Acadia')
      expect(park.admission).to eq(30)
    end

    it 'has default attributes on creation' do
      park1 = NationalPark.new({name: 'Acadia', admission: 30})
      park2 = NationalPark.new({name: 'Everglades', admission: 35})

      expect(park1.entered_vehicles).to eq([])
      expect(park2.entered_vehicles).to eq([])

      expect(park1.entered_passengers).to eq([])
      expect(park2.entered_passengers).to eq([])

      expect(park1.revenue).to eq(0)
      expect(park2.revenue).to eq(0)
    end

    it 'can have different attributes' do
      park = NationalPark.new({name: 'Everglades', admission: 35})
      expect(park.name).to eq('Everglades')
      expect(park.admission).to eq(35)
    end
  end

  describe '#add_vehicle' do
    it 'adds a vehicle to the parks list of vehicles' do
      park = NationalPark.new({name: 'Everglades', admission: 35})
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(park.entered_vehicles).to eq([])
      park.add_vehicle(vehicle)
      expect(park.entered_vehicles).to eq([vehicle])
    end

    it 'can add multiple vehicles without affecting other parks' do
      park1 = NationalPark.new({name: 'Everglades', admission: 35})
      park2 = NationalPark.new({name: 'Acadia', admission: 30})
      vehicle1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle2 = Vehicle.new("2024", "Honda", "Civic")

      expect(park1.entered_vehicles).to eq([])
      expect(park2.entered_vehicles).to eq([])

      park1.add_vehicle(vehicle1)
      park1.add_vehicle(vehicle2)

      expect(park1.entered_vehicles).to eq([vehicle1, vehicle2])
      expect(park2.entered_vehicles).to eq([])
    end
  end
  
  describe '#add_passenger' do
    context 'this method is only used by #add_vehicle' do
      it 'adds all passengers in each vehicle to the park list' do
        park = NationalPark.new({name: 'Everglades', admission: 35})
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})

        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)
        expect(vehicle.passengers).to eq([charlie, jude, taylor])

        park.add_vehicle(vehicle)
        expect(park.entered_passengers).to eq([charlie, jude, taylor])
      end

      it 'can add more passengers from new vehicles' do
        park = NationalPark.new({name: 'Acadia', admission: 30})
        vehicle1 = Vehicle.new("2001", "Honda", "Civic")
        vehicle2 = Vehicle.new("2024", "Honda", "Civic")
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})

        vehicle1.add_passenger(charlie)
        vehicle2.add_passenger(taylor)
        vehicle2.add_passenger(jude)
        expect(vehicle1.passengers).to eq([charlie])
        expect(vehicle2.passengers).to eq([taylor, jude])

        park.add_vehicle(vehicle1)
        expect(park.entered_passengers).to eq([charlie])

        park.add_vehicle(vehicle2)
        expect(park.entered_passengers).to eq([charlie, taylor, jude])
      end
    end
  end

  describe '#generate_revenue' do
    context 'this method is only used by #add_passenger' do
      it 'automatically generates revenue for each adult passenger added' do
        park = NationalPark.new({name: 'Acadia', admission: 30})
        vehicle1 = Vehicle.new("2001", "Honda", "Civic")
        vehicle2 = Vehicle.new("2024", "Honda", "Civic")
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})

        vehicle1.add_passenger(charlie)
        vehicle2.add_passenger(taylor)
        vehicle2.add_passenger(jude)

        expect(park.revenue).to eq(0)

        park.add_vehicle(vehicle1)
        expect(park.revenue).to eq(30)

        park.add_vehicle(vehicle2)
        expect(park.revenue).to eq(60)
      end
    end
  end

  context 'all lists must be alphabetical' do
    before(:each) do
      @park = NationalPark.new({name: 'Acadia', admission: 30})
      vehicle1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle2 = Vehicle.new("2024", "Honda", "Civic")
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 20})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      vehicle.add_passenger(charlie)
      vehicle.add_passenger(taylor)
      vehicle.add_passenger(jude)
      @park.add_vehicle(vehicle)
    end

    describe '#list_everyone' do
      it 'lists all passengers in the park list by name' do
        expect(@park.list_everyone).to eq(['Charlie', 'Jude', 'Taylor'])
      end
    end

    describe '#list_minors' do
      it 'lists all minors by name' do
        expect(@park.list_minors).to eq(['Taylor'])
      end
    end

    describe '#list_adults' do
      it 'lists all adults by name' do
        expect(@park.list_adults).to eq(['Charlie', 'Jude'])
      end
    end
  end
end