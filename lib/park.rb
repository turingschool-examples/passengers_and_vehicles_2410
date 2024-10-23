class Park
  attr_reader :name, :admission

  def initialize(park_data)
    @name = park_data["name"]
    @admission = park_data["admission"]
  end

end