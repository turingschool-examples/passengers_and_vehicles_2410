require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  describe "#initialization" do 
    it "exists" do 
      #charlie
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
      expect(charlie).to be_a Passenger
      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)
      expect(charlie.adult?).to eq(true)

      #taylor
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})  
      expect(taylor).to be_a Passenger
      expect(taylor.name).to eq("Taylor")
      expect(taylor.age).to eq(12)
      expect(taylor.adult?).to eq(false)

    end
  end
end