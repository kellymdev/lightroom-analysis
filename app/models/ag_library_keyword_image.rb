class AgLibraryKeywordImage < ApplicationRecord
  self.table_name = "AgLibraryKeywordImage"

  def self.tags_on_images
    AgLibraryKeywordImage.pluck(:tag)
  end
end
