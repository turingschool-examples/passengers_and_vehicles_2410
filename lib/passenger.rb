class Passenger
  attr_reader :name, :age

  def initialize(person_info)
    @name = person_info["name"]
    @age = person_info["age"]
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