class Vehicle
    attr_reader :year,
                :make,
                :model

    def initialize(year, make, model, speeding = false)
        @year = year
        @make = make
        @model = model
        @speeding = speeding
        @passengers = []
        @adult_passengers = []
    end

    def speeding?
        @speed
    end

    def speed
        @speeding = true
    end
    
    def add_passenger(name)
        @passengers << name
    end

    # def adult_passengers
    #     @passengers.find_all do |passenger|
    #         if passenger.adult?
    #             @adult_passengers << passenger
    #         end
    #     end
    # end
                

    def num_adults
        @adult_passengers.counts
    end  

end