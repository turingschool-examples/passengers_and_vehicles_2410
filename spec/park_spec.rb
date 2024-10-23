require './lib/park'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Park do
    describe '#initialization' do
        it 'exists' do
            park1 = Park.new('Shenandoah', 20)
            
            expect(park1).to be_a Park

            expect(park1.name).to eq('Shenandoah')
            expect(park1.admission).to eq(20)

            expect(park1.vehicles).to eq([])
            expect(park1.passengers).to eq([])
            expect(park1.admission_collected).to eq(0)
        end
    end

    describe ''
end

