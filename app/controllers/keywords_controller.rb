class KeywordsController < ApplicationController
  def index
    @keywords = AgLibraryKeyword.popular_keywords
  end
end
