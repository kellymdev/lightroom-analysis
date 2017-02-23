class DevelopSettingsController < ApplicationController
  def white_balances
    @white_balances = AdobeImageDevelopSetting.popular_white_balances
  end
end
