class DevelopSettingsController < ApplicationController
  def crop_sizes
    @crop_sizes = AdobeImageDevelopSetting.popular_crop_sizes
  end

  def develop_steps
    @develop_steps = AdobeLibraryImageDevelopHistoryStep.popular_develop_steps
  end

  def white_balances
    @white_balances = AdobeImageDevelopSetting.popular_white_balances
  end
end
