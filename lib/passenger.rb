class Passenger
    attr_reader :name, :age

    def initialize(hash)
        @name = hash["name"]
        @age = hash["age"]
    end

    def adult?
        if @age >= 18
            return true
        else
            return false
        end
    end
end