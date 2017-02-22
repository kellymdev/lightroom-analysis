require 'rails_helper'

RSpec.describe GraphsController, type: :controller do
  describe '#keyword_data' do
    let!(:tag) { AgLibraryKeyword.create!(id_global: "1", lc_name: "test", name: "Test", dateCreated: Time.now.to_i) }
    let!(:image) { AgLibraryKeywordImage.create(image: 1, tag: tag.id_local) }

    let(:expected_data) {
      [{
        name: tag.name,
        frequency: 1
      }]
    }

    it 'returns a list of keywords as json' do
      get :keyword_data, params: { format: :json }

      expect(response.body).to eq(expected_data.to_json)
    end
  end
end
