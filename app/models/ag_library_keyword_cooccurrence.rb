class AgLibraryKeywordCooccurrence < ApplicationRecord
  self.table_name = 'AgLibraryKeywordCooccurrence'

  def self.paired_keywords(limit)
    paired_tags = AgLibraryKeywordCooccurrence.order(value: :desc).limit(limit * 2)

    keywords = []

    paired_tags.each_with_index do |pair, index|
      next if index % 2 == 0

      keywords << [AgLibraryKeyword.find_by(id_local: pair.tag1), AgLibraryKeyword.find_by(id_local: pair.tag2)]
    end

    keywords
  end
end
