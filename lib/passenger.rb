class Passenger 
    attr_reader :name, :age
  
    def initialize(info)
      @name = info["name"]
      @age = info["age"]
      @driver = false
    end
end