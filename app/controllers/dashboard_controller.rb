class DashboardController < ApplicationController
  def index
    @flashed_images = AgHarvestedExifMetadata.image_count_using_flash

    @popular_keywords = AgLibraryKeyword.popular_keywords(10)
    @recent_keywords = AgLibraryKeywordPopularity.recent_keywords(10)
    @paired_keywords = AgLibraryKeywordCooccurrence.paired_keywords(10)

    @popular_apertures = AgHarvestedExifMetadata.popular_apertures(10)
    @popular_focal_lengths = AgHarvestedExifMetadata.popular_focal_lengths(10)
    @popular_lenses = AgHarvestedExifMetadata.popular_lenses(10)
    @popular_isos = AgHarvestedExifMetadata.popular_isos(10)
    @popular_shutterspeeds = AgHarvestedExifMetadata.popular_shutterspeeds(10)
    @popular_cameras = AgHarvestedExifMetadata.popular_cameras(10)
  end
end
