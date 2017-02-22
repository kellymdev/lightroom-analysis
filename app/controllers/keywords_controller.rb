class KeywordsController < ApplicationController
  def index
    @keywords = AgLibraryKeyword.popular_keywords
  end

  def paired_keywords
    @keywords = AgLibraryKeywordCooccurrence.paired_keywords
  end
end
