class Passenger
    attr_reader :name, :age

    def initialize(hash)
        @name = hash["name"]
        @age = hash["age"]
    end
end