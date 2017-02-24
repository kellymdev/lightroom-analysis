require 'rails_helper'

RSpec.describe AdobeImage, type: :model do
  let!(:image) { AdobeImage.create!(id_global: 'ABC123', fileFormat: 'RAW', rating: 3, touchCount: 2) }

  describe '#popular_file_formats' do
    let(:expected_data) do
      [{
        format: image.fileFormat,
        frequency: 1
      }]
    end

    it 'returns a list of file formats with their frequencies' do
      expect(AdobeImage.popular_file_formats).to eq(expected_data)
    end
  end

  describe '#popular_ratings' do
    let(:expected_data) do
      [{
        rating: image.rating,
        frequency: 1
      }]
    end

    it 'returns a list of ratings with their frequencies' do
      expect(AdobeImage.popular_ratings).to eq(expected_data)
    end
  end

  describe '#popular_update_counts' do
    let(:expected_data) do
      [{
        update_count: image.touchCount,
        frequency: 1
      }]
    end

    it 'returns a list of update counts with their frequencies' do
      expect(AdobeImage.popular_update_counts).to eq(expected_data)
    end
  end
end
