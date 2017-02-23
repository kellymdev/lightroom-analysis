require 'rails_helper'

RSpec.describe GraphsController, type: :controller do
  describe '#keyword_data' do
    let!(:tag) { AgLibraryKeyword.create!(id_global: "1", lc_name: "test", name: "Test", dateCreated: Time.now.to_i) }
    let!(:image) { AgLibraryKeywordImage.create(image: 1, tag: tag.id_local) }

    let(:expected_data) do
      [{
        name: tag.name,
        frequency: 1
      }]
    end

    it 'returns a list of keywords as json' do
      get :keyword_data, params: { format: :json }

      expect(response.body).to eq(expected_data.to_json)
    end
  end

  describe '#lenses_by_camera_data' do
    let!(:lens) { AgInternedExifLens.create!(searchIndex: "/t105mm/tis/tef24/tf/4l/tusm/t", value: "EF24-105mm f/4L IS USM") }
    let!(:camera) { AgInternedExifCameraModel.create!(searchIndex: "/tcanon/teos/t7d/t", value: "Canon EOS 7D") }
    let!(:exif) { AgHarvestedExifMetadata.create!(image: 1, cameraModelRef: camera.id_local, lensRef: lens.id_local) }

    let(:expected_data) do
      [{
        lens: "#{camera.value}, #{lens.value}",
        frequency: 1
      }]
    end

    it 'returns a list of camera and lens data as json' do
      get :lenses_by_camera_data, params: { format: :json }

      expect(response.body).to eq(expected_data.to_json)
    end
  end
end
