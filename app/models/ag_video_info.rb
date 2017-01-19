class AgVideoInfo < ApplicationRecord
  self.table_name = 'AgVideoInfo'

  def self.video_file_count
    AgVideoInfo.count
  end
end
