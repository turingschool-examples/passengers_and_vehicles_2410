class Passenger
    attr_reader :name, :age, :drive

    def initialize(passenger_info)
        @name = passenger_info["name"]
        @age = passenger_info["age"]
        @drive = true
    end

    def adult?
        @age >= 18
    end

    def driver?
        @drive = !@drive
        @drive
    end

end