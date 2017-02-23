class DevelopSettingsController < ApplicationController
  def crop_sizes
    @crop_sizes = AdobeImageDevelopSetting.popular_crop_sizes
  end

  def white_balances
    @white_balances = AdobeImageDevelopSetting.popular_white_balances
  end
end
