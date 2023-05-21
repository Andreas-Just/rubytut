# frozen_string_literal: true

RSpec.describe ClothingItem do
  let(:item) { ClothingItem.new(name: 'Шарф', type: 'Шея', temp_range: (-10..10)) }

  describe '#initialize' do
    it 'assigns name, type and temp_range' do
      expect(item.name).to eq('Шарф')
      expect(item.type).to eq('Шея')
      expect(item.temp_range).to eq((-10..10))
    end
  end

  describe '#suitable_for_temperature?' do
    it 'returns true for temperatures within the range' do
      expect(item.suitable_for_temperature?(0)).to be(true)
    end

    it 'returns false for temperatures outside the range' do
      expect(item.suitable_for_temperature?(20)).to be(false)
    end
  end

  describe '#to_s' do
    it 'returns a string in the correct format' do
      expect(item.to_s).to eq('Шарф (Шея) -10°C..10°C')
    end
  end
end
