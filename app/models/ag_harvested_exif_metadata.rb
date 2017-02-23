class AgHarvestedExifMetadata < ApplicationRecord
  extend FrequencyCalculator

  self.table_name = 'AgHarvestedExifMetadata'

  def self.popular_apertures(limit = apertures.count)
    frequencies = calculate_frequencies(apertures)

    frequencies[0..(limit - 1)].map do |aperture|
      {
        aperture: aperture.first,
        frequency: aperture.second
      }
    end
  end

  def self.popular_focal_lengths(limit = focal_lengths.count)
    frequencies = calculate_frequencies(focal_lengths)

    frequencies[0..(limit - 1)].map do |focal_length|
      {
        focal_length: focal_length.first.to_i,
        frequency: focal_length.second
      }
    end
  end

  def self.popular_lenses(limit = AgInternedExifLens.count)
    frequencies = calculate_frequencies(lenses)

    frequencies[0..(limit - 1)].map do |lens|
      {
        lens: find_lens(lens.first),
        frequency: lens.second
      }
    end
  end

  def self.lens_list
    popular_lenses.map do |lens|
      {
        lens: lens[:lens][:value],
        frequency: lens[:frequency]
      }
    end
  end

  def self.popular_isos(limit = isos.count)
    frequencies = calculate_frequencies(isos)

    frequencies[0..(limit - 1)].map do |iso|
      {
        iso: iso.first.to_i,
        frequency: iso.second
      }
    end
  end

  def self.popular_shutterspeeds(limit = shutterspeeds.count)
    frequencies = calculate_frequencies(shutterspeeds)

    frequencies[0..(limit - 1)].map do |shutterspeed|
      {
        shutterspeed: shutterspeed.first,
        frequency: shutterspeed.second
      }
    end
  end

  def self.popular_cameras(limit = cameras.count)
    frequencies = calculate_frequencies(cameras)

    frequencies[0..(limit - 1)].map do |camera|
      next unless camera.first

      {
        camera: find_camera(camera.first),
        frequency: camera.second
      }
    end.compact
  end

  def self.camera_list
    popular_cameras.map do |camera|
      {
        camera: camera[:camera][:value],
        frequency: camera[:frequency]
      }
    end
  end

  def self.popular_focal_lengths_with_cameras(limit)
    frequencies = calculate_frequencies(focal_lengths_with_cameras)

    frequencies[0..(limit - 1)].map do |camera|
      next unless camera.first.first

      {
        camera: find_camera(camera.first.first),
        focal_length: camera.first.second.to_i,
        frequency: camera.second
      }
    end.compact
  end

  def self.popular_isos_with_cameras(limit = isos_with_cameras.count)
    frequencies = calculate_frequencies(isos_with_cameras)

    frequencies[0..(limit - 1)].map do |camera|
      next unless camera.first.first

      {
        camera: find_camera(camera.first.first),
        iso: camera.first.second.to_i,
        frequency: camera.second
      }
    end.compact
  end

  def self.isos_by_camera_list
    popular_isos_with_cameras(100).map do |iso|
      {
        iso: "#{iso[:camera].value}, Iso #{iso[:iso]}",
        frequency: iso[:frequency]
      }
    end
  end

  def self.popular_lenses_with_cameras(limit)
    frequencies = calculate_frequencies(lenses_with_cameras)

    frequencies[0..(limit - 1)].map do |camera|
      next unless camera.first.first

      {
        camera: find_camera(camera.first.first),
        lens: find_lens(camera.first.second),
        frequency: camera.second
      }
    end
  end

  def self.image_count_using_flash
    AgHarvestedExifMetadata.select { |image| image.flashFired == 1 }.count
  end

  private

  def self.find_camera(camera_id)
    AgInternedExifCameraModel.find_by(id_local: camera_id)
  end

  def self.find_lens(lens_id)
    AgInternedExifLens.find_by(id_local: lens_id)
  end

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

  def self.focal_lengths_with_cameras
    AgHarvestedExifMetadata.pluck(:cameraModelRef, :focalLength).compact
  end

  def self.isos_with_cameras
    AgHarvestedExifMetadata.pluck(:cameraModelRef, :isoSpeedRating).compact
  end

  def self.lenses_with_cameras
    AgHarvestedExifMetadata.pluck(:cameraModelRef, :lensRef).compact
  end
end
