require './lib/trail'
require './lib/park'
require './lib/hiker'

RSpec.describe Hiker do
  context 'exists' do
    hiker = Hiker.new('Dora', :moderate)
    park1 = Park.new('Capitol Reef')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})

    it 'it is a hiker' do
      expect(hiker).to be_instance_of(Hiker)
    end

    it 'has attributes' do
      expect(hiker.name).to eq("Dora")
      expect(hiker.experience_level).to eq(:moderate)
      expect(hiker.snacks).to eq({})
      expect(hiker.parks_visited).to eq([])
    end
  end

  context 'hiker details' do
    hiker = Hiker.new('Dora', :moderate)
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})

    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park2.add_trail(trail3)

    it 'can add snacks' do
      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)
      expect(hiker.snacks).to eq({"water"=>1, "trail mix"=>3})

      hiker.pack('water', 1)
      expect(hiker.snacks).to eq({"water"=>2, "trail mix"=>3})
    end

    it 'can add places visited' do
      hiker.visit(park1)
      hiker.visit(park2)
      expect(hiker.parks_visited).to eq([park1, park2])
    end
  end

  context 'hike details' do
    hiker = Hiker.new('Dora', :moderate)
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})

    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)

    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)

    hiker.visit(park1)
    hiker.visit(park2)

    it 'can find trails to hike' do
      expected = [trail1, trail2, trail3, trail4, trail5, trail6]
      expect(hiker.possible_trails).to eq(expected)
    end
  end

  context 'favorite snack and trail levels' do
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    hiker = Hiker.new('Dora', :moderate)

    hiker.pack('water', 2)
    hiker.pack('trail mix', 1)
    hiker.pack('apple', 4)
    hiker.pack('carrot', 3)

    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)

    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)

    it 'can find favorite snack' do
      expect(hiker.favorite_snack).to eq("apple")
    end
  end
end