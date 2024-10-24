class Vehicle 
    attr_reader :year,
                :make,
                :model,
                :passengers
  
    def initialize(year, make, model)
      @year = year
      @make = make
      @model = model
      @speeding = false
      @passengers = []
    end
end