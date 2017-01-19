class AdobeImageDevelopSetting < ApplicationRecord
  self.table_name = 'Adobe_imageDevelopSettings'

  def self.popular_crop_sizes(limit)
    crop_frequencies = frequencies(crop_sizes)

    sorted = crop_frequencies.sort_by { |crop_size, frequency| frequency }.reverse

    sorted[0..(limit - 1)].map do |crop_size|
      next unless crop_size

      {
        height: crop_size.first.first.to_i,
        width: crop_size.first.second.to_i,
        frequency: crop_size.second
      }
    end.compact
  end

  private

  def self.frequencies(crop_sizes)
    frequencies = {}

    crop_sizes.each do |crop_size|
      if frequencies.has_key?(crop_size)
        frequencies[crop_size] += 1
      else
        frequencies[crop_size] = 1
      end
    end

    frequencies
  end

  def self.crop_sizes
    sizes = AdobeImageDevelopSetting.pluck(:croppedHeight, :croppedWidth).compact
    sizes.delete_if { |crop_size| crop_size.second == "uncropped" }
  end
end
