require 'rails_helper'

RSpec.describe AgLibraryKeywordCooccurrence, type: :model do
  let!(:keyword) { AgLibraryKeyword.create!(id_global: 'DEF456', dateCreated: 508563730.3633808, lc_name: 'test', name: 'Test') }
  let!(:keyword_two) { AgLibraryKeyword.create!(id_global: 'GHI789', dateCreated: 508563730.3633808, lc_name: 'name', name: 'Name') }
  let!(:cooccurrence) { AgLibraryKeywordCooccurrence.create!(tag1: keyword.id_local, tag2: keyword_two.id_local, value: 1.0) }
  let!(:cooccurence_reverse) { AgLibraryKeywordCooccurrence.create!(tag1: keyword_two.id_local, tag2: keyword.id_local, value: 1.0) }

  describe '.paired_keywords' do
    let(:expected_data) do
      [{
        tag1: keyword,
        tag2: keyword_two,
        frequency: 1
      }]
    end

    it 'returns a list of keyword pairs and their frequencies' do
      expect(AgLibraryKeywordCooccurrence.paired_keywords).to eq(expected_data)
    end
  end

  describe '.pair_list' do
    let(:expected_data) do
      [{
        name: "#{keyword.name}, #{keyword_two.name}",
        frequency: 1
      }]
    end

    it 'returns a list of keyword name pairs and their frequencies' do
      expect(AgLibraryKeywordCooccurrence.pair_list).to eq(expected_data)
    end
  end
end
