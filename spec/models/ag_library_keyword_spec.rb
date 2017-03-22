require 'rails_helper'

describe AgLibraryKeyword, type: :model do
  let!(:image) { AdobeImage.create!(id_global: 'ABC123', fileFormat: 'RAW', rating: 3, touchCount: 2) }
  let!(:keyword) { AgLibraryKeyword.create!(id_global: 'DEF456', dateCreated: 508563730.3633808, lc_name: 'test', name: 'Test') }
  let!(:keyword_image) { AgLibraryKeywordImage.create!(image: image.id_local, tag: keyword.id_local) }

  describe '.popular_keywords' do
    let(:expected_data) do
      [{
        tag: keyword,
        frequency: 1
      }]
    end

    it 'returns a list of keywords and their frequencies' do
      expect(AgLibraryKeyword.popular_keywords).to eq(expected_data)
    end
  end

  describe '.keyword_list' do
    let(:expected_data) do
      [{
        name: keyword.name,
        frequency: 1
      }]
    end

    it 'returns a list of keyword names and their frequencies' do
      expect(AgLibraryKeyword.keyword_list).to eq(expected_data)
    end
  end
end
