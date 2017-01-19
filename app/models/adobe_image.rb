class AdobeImage < ApplicationRecord
  extend FrequencyCalculator

  self.table_name = 'Adobe_images'

  def self.popular_file_formats(limit)
    frequencies = calculate_frequencies(file_formats)

    frequencies[0..(limit - 1)].map do |file_format|
      {
        format: file_format.first,
        frequency: file_format.second
      }
    end
  end

  private

  def self.file_formats
    AdobeImage.pluck(:fileFormat).compact
  end
end
