require_relative '../lib/vehicle'

RSpec.configure do |config|
    config.formatter = :documentation
  end

RSpec.describe Vehicle do
    describe "#initialization" do
        it "exists" do 
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
            expect(vehicle).to be_a Vehicle 
        end
    end
end