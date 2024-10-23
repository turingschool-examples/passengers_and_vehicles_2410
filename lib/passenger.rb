class Passenger
    attr_accessor :name, :age
    def initialize(data)
        @name = data["name"]
        @age = data["age"]
        @driver = true
    end

    def adult?
        @age >= 18
    end

    def driver?
        if @driver == true && @name == "Charlie"
            true
        else
            false
        end
    end 
end