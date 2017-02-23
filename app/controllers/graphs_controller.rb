class GraphsController < ApplicationController
  def keyword_data
    respond_to do |format|
      format.json { render json: AgLibraryKeyword.keyword_list.as_json }
    end
  end

  def paired_keyword_data
    respond_to do |format|
      format.json { render json: AgLibraryKeywordCooccurrence.pair_list.as_json }
    end
  end

  def file_format_data
    respond_to do |format|
      format.json { render json: AdobeImage.popular_file_formats.as_json }
    end
  end

  def rating_data
    respond_to do |format|
      format.json { render json: AdobeImage.popular_ratings.as_json }
    end
  end

  def aperture_data
    respond_to do |format|
      format.json { render json: AgHarvestedExifMetadata.popular_apertures(100).as_json }
    end
  end

  def focal_length_data
    respond_to do |format|
      format.json { render json: AgHarvestedExifMetadata.popular_focal_lengths(100).as_json }
    end
  end

  def lens_data
    respond_to do |format|
      format.json { render json: AgHarvestedExifMetadata.lens_list.as_json }
    end
  end
end
