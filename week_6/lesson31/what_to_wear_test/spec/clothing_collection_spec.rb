# frozen_string_literal: true

RSpec.describe ClothingCollection do
  let(:collection) { ClothingCollection.read_from_folder(fixture_path('*.txt')) }

  describe '.read_from_folder' do
    it 'reads clothing items from the specified folder' do
      expect(collection.size).to be 4
    end

    it 'creates ClothingItem instances for each item in the folder' do
      collection.each do |item|
        expect(item).to be_a(ClothingItem)
      end
    end
  end

  describe '#clothing_types' do
    it 'returns the unique clothing types in the collection' do
      expect(collection.clothing_types).to match_array(['Верхняя одежда', 'Головной убор', 'Обувь', 'Штаны'])
    end
  end

  describe '#items_of_type' do
    it 'returns the items of a certain type' do
      expect(collection.items_of_type('Нижнее бельё')).to all(be_a(ClothingItem))
      expect(collection.items_of_type('Нижнее бельё')).to all(have_attributes(type: 'Нижнее бельё'))
    end
  end
end
