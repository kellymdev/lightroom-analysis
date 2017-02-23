class ImagesController < ApplicationController
  def file_formats
    @formats = AdobeImage.popular_file_formats
  end

  def ratings
    @ratings = AdobeImage.popular_ratings
  end

  def updates
    @updates = AdobeImage.popular_update_counts
  end
end
