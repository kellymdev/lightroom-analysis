require 'rails_helper'

RSpec.describe GraphsController, type: :controller do
  context 'for keyword data' do
    let!(:tag1) { AgLibraryKeyword.create!(id_global: '1', lc_name: 'test', name: 'Test', dateCreated: Time.now.to_i) }
    let!(:tag2) { AgLibraryKeyword.create!(id_global: '2', lc_name: 'macro', name: 'Macro', dateCreated: Time.now.to_i) }

    describe '#keyword_data' do
      let!(:image) { AgLibraryKeywordImage.create(image: 1, tag: tag1.id_local) }

      let(:expected_data) do
        [{
          name: tag1.name,
          frequency: 1
        }]
      end

      it 'returns a list of keywords as json' do
        get :keyword_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#paired_keyword_data' do
      let!(:pair) { AgLibraryKeywordCooccurrence.create!(tag1: tag1.id_local, tag2: tag2.id_local, value: 1) }
      let!(:pair2) { AgLibraryKeywordCooccurrence.create!(tag1: tag2.id_local, tag2: tag1.id_local, value: 1) }

      let(:expected_data) do
        [{
          name: "#{tag1.name}, #{tag2.name}",
          frequency: 1
        }]
      end

      it 'returns a list of keyword pairs as json' do
        get :paired_keyword_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end
  end

  context 'for image data' do
    let!(:image) { AdobeImage.create!(id_global: 'ABC123', fileFormat: 'RAW', rating: 3, touchCount: 2) }

    describe '#file_format_data' do
      let(:expected_data) do
        [{
          format: image.fileFormat,
          frequency: 1
        }]
      end

      it 'returns a list of file formats as json' do
        get :file_format_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#rating_data' do
      let(:expected_data) do
        [{
          rating: image.rating.to_i,
          frequency: 1
        }]
      end

      it 'returns a list of ratings as json' do
        get :rating_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#update_data' do
      let(:expected_data) do
        [{
          update_count: image.touchCount.to_i,
          frequency: 1
        }]
      end

      it 'returns a list of update counts as json' do
        get :update_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end
  end

  context 'for exif data' do
    let!(:lens) { AgInternedExifLens.create!(searchIndex: '/t105mm/tis/tef24/tf/4l/tusm/t', value: 'EF24-105mm f/4L IS USM') }
    let!(:camera) { AgInternedExifCameraModel.create!(searchIndex: '/tcanon/teos/t7d/t', value: 'Canon EOS 7D') }
    let!(:exif) { AgHarvestedExifMetadata.create!(image: 1, aperture: 8.0, cameraModelRef: camera.id_local, focalLength: 67.0, isoSpeedRating: 100.0, lensRef: lens.id_local, shutterSpeed: 2.0) }

    describe '#aperture_data' do
      let(:expected_data) do
        [{
          aperture: exif.aperture,
          frequency: 1
        }]
      end

      it 'returns a list of apertures as json' do
        get :aperture_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#focal_length_data' do
      let(:expected_data) do
        [{
          focal_length: exif.focalLength.to_i,
          frequency: 1
        }]
      end

      it 'returns a list of focal lengths as json' do
        get :focal_length_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#lens_data' do
      let(:expected_data) do
        [{
          lens: lens.value,
          frequency: 1
        }]
      end

      it 'returns a list of lenses as json' do
        get :lens_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#iso_data' do
      let(:expected_data) do
        [{
          iso: exif.isoSpeedRating.to_i,
          frequency: 1
        }]
      end

      it 'returns a list of isos as json' do
        get :iso_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#shutterspeed_data' do
      let(:expected_data) do
        [{
          shutterspeed: exif.shutterSpeed,
          frequency: 1
        }]
      end

      it 'returns a list of shutterspeeds as json' do
        get :shutterspeed_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#camera_data' do
      let(:expected_data) do
        [{
          camera: camera.value,
          frequency: 1
        }]
      end

      it 'returns a list of cameras as json' do
        get :camera_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#isos_by_camera_data' do
      let(:expected_data) do
        [{
          iso: "#{camera.value}, Iso #{exif.isoSpeedRating.to_i}",
          frequency: 1
        }]
      end

      it 'returns a list of camera and iso data as json' do
        get :isos_by_camera_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#focal_lengths_by_camera_data' do
      let(:expected_data) do
        [{
          focal_length: "#{camera.value}, #{exif.focalLength.to_i}mm",
          frequency: 1
        }]
      end

      it 'returns a list of camera and focal length data as json' do
        get :focal_lengths_by_camera_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#lenses_by_camera_data' do
      let(:expected_data) do
        [{
          lens: "#{camera.value}, #{lens.value}",
          frequency: 1
        }]
      end

      it 'returns a list of camera and lens data as json' do
        get :lenses_by_camera_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end
  end

  context 'for develop settings' do
    let!(:setting) { AdobeImageDevelopSetting.create!(croppedHeight: 2928.0, croppedWidth: 4392.0, whiteBalance: 'As Shot') }
    let!(:history_step) { AdobeLibraryImageDevelopHistoryStep.create!(id_global: 'ABC', name: 'Contrast', relValueString: '+7') }

    describe '#crop_size_data' do
      let(:expected_data) do
        [{
          size: "#{setting.croppedWidth.to_i} x #{setting.croppedHeight.to_i}",
          frequency: 1
        }]
      end

      it 'returns a list of cropped sizes as json' do
        get :crop_size_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#develop_step_data' do
      let(:expected_data) do
        [{
          develop_step: history_step.name,
          frequency: 1
        }]
      end

      it 'returns a list of develop steps as json' do
        get :develop_step_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#adjustment_data' do
      let(:expected_data) do
        [{
          adjustment: "#{history_step.name} #{history_step.relValueString}",
          frequency: 1
        }]
      end

      it 'returns a list of adjustment data as json' do
        get :adjustment_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end

    describe '#white_balance_data' do
      let(:expected_data) do
        [{
          white_balance: setting.whiteBalance,
          frequency: 1
        }]
      end

      it 'returns a list of white balance data as json' do
        get :white_balance_data, params: { format: :json }

        expect(response.body).to eq(expected_data.to_json)
      end
    end
  end
end
