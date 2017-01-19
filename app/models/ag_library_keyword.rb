class AgLibraryKeyword < ApplicationRecord
  self.table_name = 'AgLibraryKeyword'

  has_one :ag_library_keyword_popularity, foreign_key: 'tag'

  def self.popular_keywords(limit)
    tags = AgLibraryKeywordImage.tags_on_images
    frequencies = tag_frequencies(tags)

    sorted = frequencies.sort_by { |tag, frequency| frequency }.reverse

    sorted[0..(limit - 1)].map do |tag|
      AgLibraryKeyword.find_by(id_local: tag)
    end
  end

  private

  def self.tag_frequencies(tag_array)
    frequencies = {}

    tag_array.each do |tag|
      if frequencies.has_key?(tag)
        frequencies[tag] += 1
      else
        frequencies[tag] = 1
      end
    end

    frequencies
  end
end
