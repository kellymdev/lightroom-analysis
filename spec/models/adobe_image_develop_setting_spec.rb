require 'rails_helper'

RSpec.describe AdobeImageDevelopSetting, type: :model do
  let!(:settings) { AdobeImageDevelopSetting.create!(croppedHeight: 2928.0, croppedWidth: 4392.0, whiteBalance: 'As Shot') }

  describe '#popular_crop_sizes' do
    let(:expected_data) do
      [{
        height: settings.croppedHeight.to_i,
        width: settings.croppedWidth.to_i,
        frequency: 1
      }]
    end

    it 'returns a list of image widths and heights with their frequencies' do
      expect(AdobeImageDevelopSetting.popular_crop_sizes).to eq(expected_data)
    end
  end

  describe '#crop_size_list' do
    let(:expected_data) do
      [{
        size: "#{settings.croppedWidth.to_i} x #{settings.croppedHeight.to_i}",
        frequency: 1
      }]
    end

    it 'returns a list of crop sizes' do
      expect(AdobeImageDevelopSetting.crop_size_list).to eq(expected_data)
    end
  end

  describe '#popular_white_balances' do
    let(:expected_data) do
      [{
        white_balance: settings.whiteBalance,
        frequency: 1
      }]
    end

    it 'returns a list of white balances with their frequencies' do
      expect(AdobeImageDevelopSetting.popular_white_balances).to eq(expected_data)
    end
  end
end
