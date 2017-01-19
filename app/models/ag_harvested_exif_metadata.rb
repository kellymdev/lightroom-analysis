class AgHarvestedExifMetadata < ApplicationRecord
  self.table_name = 'AgHarvestedExifMetadata'

  def self.popular_apertures(limit)
    frequencies = frequencies(apertures)

    sorted = frequencies.sort_by { |aperture, frequency| frequency }

    sorted[0..(limit - 1)].map do |aperture|
      aperture.first
    end
  end

  private

  def self.frequencies(data)
    frequencies = {}

    data.each do |item|
      if frequencies.has_key?(item)
        frequencies[item] += 1
      else
        frequencies[item] = 1
      end
    end

    frequencies
  end

  def self.apertures
    AgHarvestedExifMetadata.order(aperture: :desc).pluck(:aperture)
  end
end
