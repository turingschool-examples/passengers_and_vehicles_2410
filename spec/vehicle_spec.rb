require '.lib/vehicle'

Rspec.describe Vehicle do
    describe "#initialization" do
        it "exists" do 
            vehicle = Vehicle.new("2001", "Honda", "Civic")    
            expect(vehicle).to be_a Vehicle 
        end
    end
end