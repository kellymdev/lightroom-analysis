class DashboardController < ApplicationController
  def index
    @popular_keywords = AgLibraryKeyword.popular_keywords(10)
    @recent_keywords = AgLibraryKeywordPopularity.recent_keywords(10)
    @paired_keywords = AgLibraryKeywordCooccurrence.paired_keywords(10)

    @popular_apertures = AgHarvestedExifMetadata.popular_apertures(10)
  end
end
