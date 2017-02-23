class ExifController < ApplicationController
  def focal_lengths
    @focal_lengths = AgHarvestedExifMetadata.popular_focal_lengths
  end

  def lenses
    @lenses = AgHarvestedExifMetadata.popular_lenses
  end
end
