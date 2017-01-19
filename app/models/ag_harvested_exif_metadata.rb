class AgHarvestedExifMetadata < ApplicationRecord
  extend FrequencyCalculator

  self.table_name = 'AgHarvestedExifMetadata'

  def self.popular_apertures(limit)
    frequencies = calculate_frequencies(apertures)

    frequencies[0..(limit - 1)].map do |aperture|
      {
        aperture: aperture.first,
        frequency: aperture.second
      }
    end
  end

  def self.popular_focal_lengths(limit)
    frequencies = calculate_frequencies(focal_lengths)

    frequencies[0..(limit - 1)].map do |focal_length|
      {
        focal_length: focal_length.first,
        frequency: focal_length.second
      }
    end
  end

  def self.popular_lenses(limit)
    frequencies = calculate_frequencies(lenses)

    frequencies[0..(limit - 1)].map do |lens|
      {
        lens: AgInternedExifLens.find_by(id_local: lens.first),
        frequency: lens.second
      }
    end
  end

  def self.popular_isos(limit)
    frequencies = calculate_frequencies(isos)

    frequencies[0..(limit - 1)].map do |iso|
      {
        iso: iso.first.to_i,
        frequency: iso.second
      }
    end
  end

  def self.popular_shutterspeeds(limit)
    frequencies = calculate_frequencies(shutterspeeds)

    frequencies[0..(limit - 1)].map do |shutterspeed|
      {
        shutterspeed: shutterspeed.first,
        frequency: shutterspeed.second
      }
    end
  end

  def self.popular_cameras(limit)
    frequencies = calculate_frequencies(cameras)

    frequencies[0..(limit - 1)].map do |camera|
      next unless camera.first

      {
        camera: AgInternedExifCameraModel.find_by(id_local: camera.first),
        frequency: camera.second
      }
    end.compact
  end

  def self.image_count_using_flash
    AgHarvestedExifMetadata.select { |image| image.flashFired == 1 }.count
  end

  private

  def self.focal_lengths
    AgHarvestedExifMetadata.pluck(:focalLength).compact
  end

  def self.apertures
    AgHarvestedExifMetadata.pluck(:aperture).compact
  end

  def self.lenses
    AgHarvestedExifMetadata.pluck(:lensRef).compact
  end

  def self.isos
    AgHarvestedExifMetadata.pluck(:isoSpeedRating).compact
  end

  def self.shutterspeeds
    AgHarvestedExifMetadata.pluck(:shutterSpeed).compact
  end

  def self.cameras
    AgHarvestedExifMetadata.pluck(:cameraModelRef).compact
  end
end
