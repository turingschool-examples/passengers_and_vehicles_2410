class Park
  attr_reader :name, 
              :admission, 
              :admitted_vehicles, 
              :admitted_passengers,
              :revenue,
              :abc_attendees,
              :minor_attendees,
              :adult_attendees

  def initialize(park_data)
    @name = park_data["name"]
    @admission = park_data["admission"]
    @admitted_vehicles = []
    @admitted_passengers = []
    @revenue = 0.00
    @abc_attendees = []
    @minor_attendees = []
    @adult_attendees = []
  end

  def admit_vehicle(vehicle)
    @admitted_vehicles << vehicle

    passengers = vehicle.passengers 
    admit_passengers(passengers)
    organize_attendees(passengers)
    calculate_revenue
  end

  def admit_passengers(passengers)
    passengers.each do |passenger|
      @admitted_passengers << passenger.name
    end
  end

  def calculate_revenue
    @revenue += 30.00
  end

  def organize_attendees(passengers)
    passengers.each do |passenger|
      @abc_attendees << passenger.name
      alphabetize(@abc_attendees)

      if passenger.age < 18 
        @minor_attendees << passenger.name
        alphabetize(@minor_attendees)
      else
        @adult_attendees << passenger.name
        alphabetize(@adult_attendees)
      end
    end
  end

  def alphabetize(attendees_list)
    attendees_list.each do |attendee|
     
    end
  end
end