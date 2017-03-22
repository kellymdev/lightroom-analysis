require 'rails_helper'

RSpec.describe AgLibraryKeywordPopularity, type: :model do
  let!(:keyword) { AgLibraryKeyword.create!(id_global: 'DEF456', dateCreated: 508563730.3633808, lc_name: 'test', name: 'Test') }
  let!(:popularity) { AgLibraryKeywordPopularity.create!(occurrences: 2.0, popularity: 0.8264466914907496, tag: keyword.id_local) }

  describe '.recent_keywords' do
    it 'returns a list of recently used keywords' do
      expect(AgLibraryKeywordPopularity.recent_keywords(1)).to eq([keyword])
    end
  end
end
