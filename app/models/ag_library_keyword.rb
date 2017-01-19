class AgLibraryKeyword < ApplicationRecord
  extend FrequencyCalculator

  self.table_name = 'AgLibraryKeyword'

  has_one :ag_library_keyword_popularity, foreign_key: 'tag'

  def self.popular_keywords(limit)
    tags = AgLibraryKeywordImage.tags_on_images
    frequencies = calculate_frequencies(tags)

    frequencies[0..(limit - 1)].map do |tag|
      next unless tag

      {
        tag: AgLibraryKeyword.find_by(id_local: tag.first),
        frequency: tag.second
      }
    end.compact
  end
end
