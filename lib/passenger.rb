class Passenger
  attr_reader :name, :age

  def initialize(person_info)
    @name = person_info["name"]
    @age = person_info["age"]
  end

  def adult?
    @age >= 18
  end
end