class Vehicle
    attr_reader :year, :make, :model

    def initialize(year, make, model)
        @year = year
        @make = make
        @modle = model
    end
end