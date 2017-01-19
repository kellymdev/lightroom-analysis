class DashboardController < ApplicationController
  def index
    @popular_keywords = AgLibraryKeyword.popular_keywords(10)
    @recent_keywords = AgLibraryKeywordPopularity.recent_keywords(10)
  end
end
