class GraphsController < ApplicationController
  def keyword_data
    respond_to do |format|
      format.json { render json: AgLibraryKeyword.keyword_list.as_json }
    end
  end
end
