class Vehicle
    attr_reader :make, :model, :year
    def initialize(make, model, year)
        @make = make    
        @model = model    
        @year = year
        @license_plate = "#{make} #{model} #{year}"
        @passengers = []
    end

    def speeding?
        true
    end

    def passengers
        @passengers
    end 

    def add_passenger(passenger)
        passengers << passenger
    end 

    def num_adults
        2
    end
end