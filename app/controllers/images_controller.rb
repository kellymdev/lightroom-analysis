class ImagesController < ApplicationController
  def file_formats
    @formats = AdobeImage.popular_file_formats
  end
end
