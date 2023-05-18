# frozen_string_literal: true

require_relative '../lib/clothing_collection'
require_relative '../lib/clothing_item'

describe ClothingCollection do
  let(:collection) { described_class.read_from_folder('spec/fixtures') }

  describe '.read_from_folder' do
    it 'reads clothing items from the specified folder' do
      expect(collection.size).to be > 4
    end

    it 'creates ClothingItem instances for each item in the folder' do
      collection.each do |item|
        expect(item).to be_a(ClothingItem)
      end
    end
  end
end
