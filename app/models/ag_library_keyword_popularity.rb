class AgLibraryKeywordPopularity < ApplicationRecord
  self.table_name = 'AgLibraryKeywordPopularity'

  # belongs_to :ag_library_keyword

  def self.recent_keywords(limit)
    keywords = AgLibraryKeywordPopularity.order(popularity: :desc).limit(limit)

    keywords.map { |keyword| AgLibraryKeyword.find_by(id_local: keyword.tag) }
  end
end
