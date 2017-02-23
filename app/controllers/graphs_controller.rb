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
      format.json { render json: AdobeImage.popular_file_formats(100).as_json }
    end
  end

  def rating_data
    respond_to do |format|
      format.json { render json: AdobeImage.popular_ratings(100).as_json }
    end
  end

  def update_data
    respond_to do |format|
      format.json { render json: AdobeImage.popular_update_counts.as_json }
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

  def iso_data
    respond_to do |format|
      format.json { render json: AgHarvestedExifMetadata.popular_isos(100).as_json }
    end
  end

  def shutterspeed_data
    respond_to do |format|
      format.json { render json: AgHarvestedExifMetadata.popular_shutterspeeds(100).as_json }
    end
  end

  def camera_data
    respond_to do |format|
      format.json { render json: AgHarvestedExifMetadata.camera_list.as_json }
    end
  end

  def crop_size_data
    respond_to do |format|
      format.json { render json: AdobeImageDevelopSetting.crop_size_list.as_json }
    end
  end

  def develop_step_data
    respond_to do |format|
      format.json { render json: AdobeLibraryImageDevelopHistoryStep.popular_develop_steps(100) }
    end
  end

  def white_balance_data
    respond_to do |format|
      format.json { render json: AdobeImageDevelopSetting.popular_white_balances.as_json }
    end
  end
end
