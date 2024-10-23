require './lib/park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do
    describe '#initialization' do
        it 'exists' do
            park1 = Park.new('Shenandoah', 20)
            
            expect(park1).to be_a Park
        end
        
        it 'has a name and lists admission price per adult' do
            park1 = Park.new('Shenandoah', 20)

            expect(park1.name).to eq('Shenandoah')
            expect(park1.admission).to eq(20)
            
        end
  
        it 'can list all vehicles entered' do
            park1 = Park.new('Shenandoah', 20)
        
            expect(park1.vehicles).to eq([])
        end

        it 'can list all passengers admitted' do
            park1 = Park.new('Shenandoah', 20)

            expect(park1.passengers).to eq([])
        end

    end

    it 'can generate total revenue collected from admission charged' do
        park1 = Park.new('Shenandoah', 20)
        
        expect(park1.admission_collected).to eq(0)
    end

end

