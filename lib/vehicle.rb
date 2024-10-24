class Vehicle
    attr_reader :year, :make, :model
    def initialize(year, make, model)
        @year = year
        @make = make    
        @model = model
        @license_plate = "#{year} #{make} #{model}"
        @passengers = []
    end

    def speeding?
       false
    end

    def passengers
        @passengers
    end 

    def add_passenger(passenger)
        passengers << passenger
    end 

    def num_adults
        adults = 0
        @passengers.each do |passenger|
            if passenger.adult?
                adults += 1
            end
        end
        adults
    end
end