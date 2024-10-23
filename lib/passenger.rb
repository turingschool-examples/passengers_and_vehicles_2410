class Passenger
    attr_reader :name, :age

    def initialize(passenger_data)
        @name = passenger_data["name"]
        @age = passenger_data["age"]
    end

    
end