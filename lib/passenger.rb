require 'pry'

class Passenger 
    attr_reader :name, :age, :driver

    def initialize(info)
        @name = info['name']
        @age = info['age']
        @driver = false
    end

    def adult?
        @age >= 18
    end

    def driver?
        @driver
    end

    def drive
        @driver = true
    end

end

# charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
# taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 

# binding.pry