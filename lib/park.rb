class Park 
    attr_accessor :name, :admission, :vehicles, :passengers, :admission_collected

    def initialize(name, admission)
        @name = name
        @admission = admission
        @vehicles = []
        @passengers = []
        @admission_collected = 0
    end

    def admit_vehicle
    end

    def admit_passenger
    end     
end
