require './lib/trail'

RSpec.describe Trail do
  context 'exists' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

    it 'it is a trail' do
      expect(trail1).to be_instance_of(Trail)
    end

    it 'has attributes' do
      expect(trail1.name).to eq('Grand Wash')
      expect(trail1.length).to eq(2.2)
      expect(trail1.level).to eq(:easy)
    end
  end
end