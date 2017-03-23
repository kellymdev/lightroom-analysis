class ExifController < ApplicationController
  def apertures
    @apertures = AgHarvestedExifMetadata.popular_apertures
  end

  def focal_lengths
    @focal_lengths = AgHarvestedExifMetadata.popular_focal_lengths
  end

  def lenses
    @lenses = AgHarvestedExifMetadata.popular_lenses
  end

  def isos
    @isos = AgHarvestedExifMetadata.popular_isos
  end

  def shutterspeeds
    @shutterspeeds = AgHarvestedExifMetadata.popular_shutterspeeds
  end

  def cameras
    @cameras = AgHarvestedExifMetadata.popular_cameras
  end

  def isos_by_camera
    @isos_by_camera = AgHarvestedExifMetadata.popular_isos_with_cameras
  end

  def focal_lengths_by_camera
    @focal_lengths_by_camera = AgHarvestedExifMetadata.popular_focal_lengths_with_cameras
  end

  def lenses_by_camera
    @lenses_by_camera = AgHarvestedExifMetadata.popular_lenses_with_cameras
  end

  def cameras_by_year
    @cameras_by_year = AgHarvestedExifMetadata.cameras_by_year
  end

  def lenses_by_year
    @lenses_by_year = AgHarvestedExifMetadata.lenses_by_year
  end
end
