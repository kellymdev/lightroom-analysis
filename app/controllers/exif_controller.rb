class ExifController < ApplicationController
  def lenses
    @lenses = AgHarvestedExifMetadata.popular_lenses
  end
end
