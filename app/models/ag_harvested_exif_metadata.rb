class AgHarvestedExifMetadata < ApplicationRecord
  self.table_name = 'AgHarvestedExifMetadata'

  def self.popular_apertures(limit)
    frequencies = frequencies(apertures)
    sorted = sort_by_frequency(frequencies)

    sorted[0..(limit - 1)].map do |aperture|
      next unless aperture

      {
        aperture: aperture.first,
        frequency: aperture.second
      }
    end.compact
  end

  def self.popular_focal_lengths(limit)
    frequencies = frequencies(focal_lengths)
    sorted = sort_by_frequency(frequencies)

    sorted[0..(limit - 1)].map do |focal_length|
      next unless focal_length

      {
        focal_length: focal_length.first,
        frequency: focal_length.second
      }
    end.compact
  end

  def self.popular_lenses(limit)
    frequencies = frequencies(lenses)
    sorted = sort_by_frequency(frequencies)

    sorted[0..(limit - 1)].map do |lens|
      next unless lens

      {
        lens: AgInternedExifLens.find_by(id_local: lens.first),
        frequency: lens.second
      }
    end.compact
  end

  def self.popular_isos(limit)
    frequencies = frequencies(isos)
    sorted = sort_by_frequency(frequencies)

    sorted[0..(limit - 1)].map do |iso|
      next unless iso

      {
        iso: iso.first.to_i,
        frequency: iso.second
      }
    end.compact
  end

  def self.popular_shutterspeeds(limit)
    frequencies = frequencies(shutterspeeds)
    sorted = sort_by_frequency(frequencies)

    sorted[0..(limit - 1)].map do |shutterspeed|
      next unless shutterspeed

      {
        shutterspeed: shutterspeed.first,
        frequency: shutterspeed.second
      }
    end.compact
  end

  def self.popular_cameras(limit)
    frequencies = frequencies(cameras)
    sorted = sort_by_frequency(frequencies)

    sorted[0..(limit - 1)].map do |camera|
      next unless camera
      next unless camera.first

      {
        camera: AgInternedExifCameraModel.find_by(id_local: camera.first),
        frequency: camera.second
      }
    end.compact
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

  def self.sort_by_frequency(data)
    data.sort_by { |item, frequency| frequency }.reverse
  end

  def self.focal_lengths
    AgHarvestedExifMetadata.pluck(:focalLength)
  end

  def self.apertures
    AgHarvestedExifMetadata.pluck(:aperture)
  end

  def self.lenses
    AgHarvestedExifMetadata.pluck(:lensRef)
  end

  def self.isos
    AgHarvestedExifMetadata.pluck(:isoSpeedRating)
  end

  def self.shutterspeeds
    AgHarvestedExifMetadata.pluck(:shutterSpeed)
  end

  def self.cameras
    AgHarvestedExifMetadata.pluck(:cameraModelRef)
  end
end
