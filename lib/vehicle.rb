class Vehicle
    attr_reader :year, :make, :model, :speeding, :passengers

    def initialize(year, make, model)
        @year = year.to_s
        @make = make.to_s
        @model = model.to_s
        @speeding = false
        @passengers = []
    end

    def speeding?
        @speeding
    end

    def speed
        if @speeding == false
            @speeding = true
        end
    end
end