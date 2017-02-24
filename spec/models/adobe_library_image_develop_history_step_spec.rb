require 'rails_helper'

RSpec.describe AdobeLibraryImageDevelopHistoryStep, type: :model do
  let!(:history_step) { AdobeLibraryImageDevelopHistoryStep.create!(id_global: 'ABC', name: 'Contrast', relValueString: '+7') }

  describe '#popular_develop_steps' do
    let(:expected_data) do
      [{
        develop_step: history_step.name,
        frequency: 1
      }]
    end

    it 'returns a list of develop steps with their frequencies' do
      expect(AdobeLibraryImageDevelopHistoryStep.popular_develop_steps).to eq(expected_data)
    end
  end

  describe '#popular_develop_steps_with_adjustments' do
    let(:expected_data) do
      [{
        develop_step: history_step.name,
        adjustment: history_step.relValueString,
        frequency: 1
      }]
    end

    it 'returns a list of develop steps with adjustments and their frequencies' do
      expect(AdobeLibraryImageDevelopHistoryStep.popular_develop_steps_with_adjustments).to eq(expected_data)
    end
  end

  describe '#adjustments_list' do
    let(:expected_data) do
      [{
        adjustment: "#{history_step.name} #{history_step.relValueString}",
        frequency: 1
      }]
    end

    it 'returns a list of adjustments with their frequencies' do
      expect(AdobeLibraryImageDevelopHistoryStep.adjustments_list).to eq(expected_data)
    end
  end
end
