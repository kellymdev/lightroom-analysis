class AdobeImageDevelopSetting < ApplicationRecord
  extend FrequencyCalculator

  self.table_name = 'Adobe_imageDevelopSettings'

  def self.popular_crop_sizes(limit = crop_sizes.count)
    frequencies = calculate_frequencies(crop_sizes)

    frequencies[0..(limit - 1)].map do |crop_size|
      {
        height: crop_size.first.first.to_i,
        width: crop_size.first.second.to_i,
        frequency: crop_size.second
      }
    end
  end

  def self.crop_size_list
    popular_crop_sizes(100).map do |size|
      {
        size: "#{size[:width]} x #{size[:height]}",
        frequency: size[:frequency]
      }
    end
  end

  def self.popular_white_balances(limit = white_balances.count)
    frequencies = calculate_frequencies(white_balances)

    frequencies[0..(limit - 1)].map do |white_balance|
      {
        white_balance: white_balance.first,
        frequency: white_balance.second
      }
    end
  end

  private

  def self.crop_sizes
    sizes = AdobeImageDevelopSetting.pluck(:croppedHeight, :croppedWidth).compact
    sizes.delete_if { |crop_size| crop_size.second == "uncropped" }
  end

  def self.white_balances
    AdobeImageDevelopSetting.pluck(:whiteBalance).compact
  end
end
