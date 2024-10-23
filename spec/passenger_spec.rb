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
      expect(@charlie).to be_a Passenger
      expect(@charlie.name).to eq("Charlie")
      expect(@taylor.age).to eq(12)
    end
  end

  describe "adult?" do
    it "tells if passenger is an adult" do
      expect(@charlie.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)
    end
  end

  describe "driver?/drive" do
    it 'asks if passenger is a driver and changes driver to true if drive' do
      expect(@charlie.driver?).to eq(false)
      @charlie.drive
      expect(@charlie.driver?).to eq(true)
    end
  end

end