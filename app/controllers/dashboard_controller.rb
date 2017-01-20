class DashboardController < ApplicationController
  def index
    @flashed_images = AgHarvestedExifMetadata.image_count_using_flash
    @video_files = AgVideoInfo.video_file_count

    @popular_file_formats = AdobeImage.popular_file_formats(5)
    @popular_ratings = AdobeImage.popular_ratings(5)
    @popular_update_counts = AdobeImage.popular_update_counts(5)

    @popular_keywords = AgLibraryKeyword.popular_keywords(15)
    @recent_keywords = AgLibraryKeywordPopularity.recent_keywords(15)
    @paired_keywords = AgLibraryKeywordCooccurrence.paired_keywords(15)

    @popular_apertures = AgHarvestedExifMetadata.popular_apertures(10)
    @popular_focal_lengths = AgHarvestedExifMetadata.popular_focal_lengths(10)
    @popular_lenses = AgHarvestedExifMetadata.popular_lenses(10)

    @popular_isos = AgHarvestedExifMetadata.popular_isos(10)
    @popular_shutterspeeds = AgHarvestedExifMetadata.popular_shutterspeeds(10)
    @popular_cameras = AgHarvestedExifMetadata.popular_cameras(10)

    @popular_isos_with_cameras = AgHarvestedExifMetadata.popular_isos_with_cameras(10)
    @popular_focal_lengths_with_cameras = AgHarvestedExifMetadata.popular_focal_lengths_with_cameras(10)
    @popular_lenses_with_cameras = AgHarvestedExifMetadata.popular_lenses_with_cameras(10)

    @popular_crop_sizes = AdobeImageDevelopSetting.popular_crop_sizes(10)
    @popular_develop_steps = AdobeLibraryImageDevelopHistoryStep.popular_develop_steps(10)
    @popular_develop_steps_with_adjustments = AdobeLibraryImageDevelopHistoryStep.popular_develop_steps_with_adjustments(10)

    @popular_white_balances = AdobeImageDevelopSetting.popular_white_balances(5)
  end
end
