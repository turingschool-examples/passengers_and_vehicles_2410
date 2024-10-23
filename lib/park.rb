class Park 
    attr_accessor :name, :admission, :vehicles, :visitors, :admission_collected

    def initialize(name, admission)
        @name = name
        @admission = admission
        @vehicles = []
        @visitors = []
        @admission_collected = 0
    end

    def admit_vehicle(vehicle)
        @vehicles << vehicle
    end

    def admit_passengers(vehicle)
        @vistors << vehicle.passengers
    end     
end
