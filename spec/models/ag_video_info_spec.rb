require 'rails_helper'

RSpec.describe AgVideoInfo, type: :model do
  let!(:video) { AgVideoInfo.create!(duration: "000000000000062E/0000000000000019", frame_rate: "0000000000000019/0000000000000001", has_audio: 1, has_video: 1, image: 215314, poster_frame: "0000000000000000/0000000000000001", poster_frame_set_by_user: 0, trim_end: "0000000000000000/0000000000000001", trim_start: "0000000000000000/0000000000000001") }

  describe '.video_file_count' do
    it 'returns the number of video files' do
      expect(AgVideoInfo.video_file_count).to eq(1)
    end
  end
end
