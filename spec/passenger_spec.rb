require './lib/passenger'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Passenger do
  describe "#initialization" do 
    it "exists" do   
      charlie = Passenger.new({name: 'Charlie', age: 18})
      taylor = Passenger.new({name: 'Taylor', age: 12})
      
      expect(charlie).to be_a Passenger
      expect(charlie.name).to eq('Charlie')
      expect(charlie.age).to eq(18)

      expect(taylor).to be_a Passenger
      expect(taylor.name).to eq('Taylor')
      expect(taylor.age).to eq(12)
    end
  end

  describe "#adult?" do
    it "accurately determines adulthood" do
      charlie = Passenger.new({name: 'Charlie', age: 18})
      taylor = Passenger.new({name: 'Taylor', age: 12})
      
      expect(charlie.adult?).to eq(true)
      expect(taylor.adult?).to eq(false)
    end
  end

  describe "driver?" do
    it "verifies driver default is false" do
      charlie = Passenger.new({name: 'Charlie', age: 18})
      taylor = Passenger.new({name: 'Taylor', age: 12})
      
      expect(charlie.driver?).to eq(false)
      expect(taylor.driver?).to eq(false)
    end
  end

  describe "drive" do
    it "changes driver status" do
      charlie = Passenger.new({name: 'Charlie', age: 18})
      
      expect(charlie.driver?).to eq(false)
      charlie.drive
      expect(charlie.driver?).to eq(true)
    end
  end
end