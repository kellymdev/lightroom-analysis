class AdobeImageDevelopSetting < ApplicationRecord
  self.table_name = 'Adobe_imageDevelopSettings'

  def self.popular_crop_sizes(limit)
    crop_frequencies = frequencies(crop_sizes)
    sorted = sort_by_frequency(crop_frequencies)

    sorted[0..(limit - 1)].map do |crop_size|
      next unless crop_size

      {
        height: crop_size.first.first.to_i,
        width: crop_size.first.second.to_i,
        frequency: crop_size.second
      }
    end.compact
  end

  def self.popular_white_balances(limit)
    white_balance_frequencies = frequencies(white_balances)
    sorted = sort_by_frequency(white_balance_frequencies)

    sorted[0..(limit - 1)].map do |white_balance|
      next unless white_balance

      {
        white_balance: white_balance.first,
        frequency: white_balance.second
      }
    end.compact
  end

  private

  def self.sort_by_frequency(data)
    data.sort_by { |crop_size, frequency| frequency }.reverse
  end

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

  def self.crop_sizes
    sizes = AdobeImageDevelopSetting.pluck(:croppedHeight, :croppedWidth).compact
    sizes.delete_if { |crop_size| crop_size.second == "uncropped" }
  end

  def self.white_balances
    AdobeImageDevelopSetting.pluck(:whiteBalance).compact
  end
end
