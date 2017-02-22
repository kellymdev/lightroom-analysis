class KeywordsController < ApplicationController
  def popular_keywords
    @keywords = AgLibraryKeyword.popular_keywords
  end
end
