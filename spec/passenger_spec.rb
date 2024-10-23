require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do 
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})  
  end

  describe "#initialization" do 
    it "exists" do 
      #charlie
      expect(@charlie).to be_a Passenger
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie.age).to eq(18)

      #taylor
      expect(@taylor).to be_a Passenger
      expect(@taylor.name).to eq("Taylor")
      expect(@taylor.age).to eq(12)
    end
  end

  describe "#adult?" do
    it "can check if age is >= 18" do 
      expect(@charlie.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)
    end
  end

  describe "#driver?" do
    it "can be a driver" do
      expect(@charlie.driver?).to eq(false)
      @charlie.drive
      expect(@charlie.driver?).to eq(true)

      expect(@taylor.driver?).to eq(false)
      @taylor.drive
      expect(@taylor.driver?).to eq(false)
    end
  end
end