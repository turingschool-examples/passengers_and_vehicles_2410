class Vehicle
    attr_reader :year, :make, :model, :speed, :passengers, :enter_park

    def initialize(year, make, model)
        @year = year
        @make = make
        @model = model
        @speed = true
        @passengers = []
        @enter_park = true

    end

    def speeding?
        @speed = !@speed
        @speed
    end

    def add_passenger(passenger)
        @passengers << passenger
    end

    def num_adults
        @adults = 0

        @passengers.each do |passenger|
            if passenger.adult?
                @adults += 1
            end
        end
        @adults
    end

end