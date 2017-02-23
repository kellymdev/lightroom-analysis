class AdobeImage < ApplicationRecord
  extend FrequencyCalculator

  self.table_name = 'Adobe_images'

  def self.popular_file_formats(limit = file_formats.count)
    frequencies = calculate_frequencies(file_formats)

    frequencies[0..(limit - 1)].map do |file_format|
      {
        format: file_format.first,
        frequency: file_format.second
      }
    end
  end

  def self.popular_ratings(limit)
    frequencies = calculate_frequencies(ratings)

    frequencies[0..(limit - 1)].map do |rating|
      {
        rating: rating.first.to_i,
        frequency: rating.second
      }
    end
  end

  def self.popular_update_counts(limit)
    frequencies = calculate_frequencies(updates)

    frequencies[0..(limit - 1)].map do |update_count|
      {
        update_count: update_count.first.to_i,
        frequency: update_count.second
      }
    end
  end

  private

  def self.file_formats
    AdobeImage.pluck(:fileFormat).compact
  end

  def self.ratings
    AdobeImage.pluck(:rating).compact
  end

  def self.updates
    AdobeImage.pluck(:touchCount).compact
  end
end
