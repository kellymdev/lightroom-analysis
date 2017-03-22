require 'rails_helper'

RSpec.describe AgLibraryKeywordImage, type: :model do
  let!(:keyword_image) { AgLibraryKeywordImage.create!(image: 5433, tag: 1234) }

  describe '.tags_on_images' do
    it 'returns a list of keyword ids' do
      expect(AgLibraryKeywordImage.tags_on_images).to eq([1234])
    end
  end
end
