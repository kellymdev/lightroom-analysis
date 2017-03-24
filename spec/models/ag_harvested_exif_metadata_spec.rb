require 'rails_helper'

RSpec.describe AgHarvestedExifMetadata, type: :model do
  let!(:lens) { AgInternedExifLens.create!(searchIndex: '/t105mm/tis/tef24/tf/4l/tusm/t', value: 'EF24-105mm f/4L IS USM') }
  let!(:camera) { AgInternedExifCameraModel.create!(searchIndex: '/tcanon/teos/t7d/t', value: 'Canon EOS 7D') }
  let!(:exif) { AgHarvestedExifMetadata.create!(image: 1, aperture: 8.0, cameraModelRef: camera.id_local, dateYear: 2017.0, flashFired: 0, focalLength: 67.0, isoSpeedRating: 100.0, lensRef: lens.id_local, shutterSpeed: 2.0) }

  describe '.popular_apertures' do
    let(:expected_data) do
      [{
        aperture: exif.aperture,
        frequency: 1
      }]
    end

    it 'returns a list of apertures with their frequencies' do
      expect(AgHarvestedExifMetadata.popular_apertures).to eq(expected_data)
    end
  end

  describe '.popular_focal_lengths' do
    let(:expected_data) do
      [{
        focal_length: exif.focalLength,
        frequency: 1
      }]
    end

    it 'returns a list of focal lengths with their frequencies' do
      expect(AgHarvestedExifMetadata.popular_focal_lengths).to eq(expected_data)
    end
  end

  describe '.popular_lenses' do
    let(:expected_data) do
      [{
        lens: lens,
        frequency: 1
      }]
    end

    it 'returns a list of lenses with their frequencies' do
      expect(AgHarvestedExifMetadata.popular_lenses).to eq(expected_data)
    end
  end

  describe '.lens_list' do
    let(:expected_data) do
      [{
        lens: lens.value,
        frequency: 1
      }]
    end

    it 'returns a list of lens values with their frequencies' do
      expect(AgHarvestedExifMetadata.lens_list).to eq(expected_data)
    end
  end

  describe '.popular_isos' do
    let(:expected_data) do
      [{
        iso: exif.isoSpeedRating,
        frequency: 1
      }]
    end

    it 'returns a list of isos with their frequencies' do
      expect(AgHarvestedExifMetadata.popular_isos).to eq(expected_data)
    end
  end

  describe '.popular_shutterspeeds' do
    let(:expected_data) do
      [{
        shutterspeed: exif.shutterSpeed,
        frequency: 1
      }]
    end

    it 'returns a list of shutterspeeds with their frequencies' do
      expect(AgHarvestedExifMetadata.popular_shutterspeeds).to eq(expected_data)
    end
  end

  describe '.popular_cameras' do
    let(:expected_data) do
      [{
        camera: camera,
        frequency: 1
      }]
    end

    it 'returns a list of cameras with their frequencies' do
      expect(AgHarvestedExifMetadata.popular_cameras).to eq(expected_data)
    end
  end

  describe '.camera_list' do
    let(:expected_data) do
      [{
        camera: camera.value,
        frequency: 1
      }]
    end

    it 'returns a list of camera values with their frequencies' do
      expect(AgHarvestedExifMetadata.camera_list).to eq(expected_data)
    end
  end

  describe '.popular_focal_lengths_with_cameras' do
    let(:expected_data) do
      [{
        camera: camera,
        focal_length: exif.focalLength,
        frequency: 1
      }]
    end

    it 'returns a list of cameras, focal lengths and their frequencies' do
      expect(AgHarvestedExifMetadata.popular_focal_lengths_with_cameras).to eq(expected_data)
    end
  end

  describe '.focal_lengths_by_camera_list' do
    let(:expected_data) do
      [{
        focal_length: "#{camera.value}, #{exif.focalLength.to_i}mm",
        frequency: 1
      }]
    end

    it 'returns a list of camera values with focal lengths and their frequencies' do
      expect(AgHarvestedExifMetadata.focal_lengths_by_camera_list).to eq(expected_data)
    end
  end

  describe '.popular_isos_with_cameras' do
    let(:expected_data) do
      [{
        camera: camera,
        iso: exif.isoSpeedRating.to_i,
        frequency: 1
      }]
    end

    it 'returns a list of cameras, isos and their frequencies' do
      expect(AgHarvestedExifMetadata.popular_isos_with_cameras).to eq(expected_data)
    end
  end

  describe '.isos_by_camera_list' do
    let(:expected_data) do
      [{
        iso: "#{camera.value}, Iso #{exif.isoSpeedRating.to_i}",
        frequency: 1
      }]
    end

    it 'returns a list of camera values with isos and their frequencies' do
      expect(AgHarvestedExifMetadata.isos_by_camera_list).to eq(expected_data)
    end
  end

  describe '.popular_lenses_with_cameras' do
    let(:expected_data) do
      [{
        camera: camera,
        lens: lens,
        frequency: 1
      }]
    end

    it 'returns a list of cameras, lenses and their frequencies' do
      expect(AgHarvestedExifMetadata.popular_lenses_with_cameras).to eq(expected_data)
    end
  end

  describe '.lenses_by_camera_list' do
    let(:expected_data) do
      [{
        lens: "#{camera.value}, #{lens.value}",
        frequency: 1
      }]
    end

    it 'returns a list of camera values and lens values with their frequencies' do
      expect(AgHarvestedExifMetadata.lenses_by_camera_list).to eq(expected_data)
    end
  end

  describe '.cameras_by_year' do
    let(:expected_data) do
      {
        '2017' => [{
          camera: camera,
          camera_percentage: 100.00,
          frequency: 1
        }]
      }
    end

    it 'returns a list of cameras, years and frequencies' do
      expect(AgHarvestedExifMetadata.cameras_by_year).to eq(expected_data)
    end
  end

  describe '.cameras_by_year_list' do
    let(:expected_data) do
      [{
        year: 2017,
        camera: camera.value,
        frequency: 1
      }]
    end

    it 'returns a list of camera values with frequencies for each year' do
      expect(AgHarvestedExifMetadata.cameras_by_year_list).to eq(expected_data)
    end
  end

  describe '.lenses_by_year' do
    let(:expected_data) do
      {
        '2017' => [{
          lens: lens,
          frequency: 1
        }]
      }
    end

    it 'returns a list of lenses, years and frequencies' do
      expect(AgHarvestedExifMetadata.lenses_by_year).to eq(expected_data)
    end
  end

  describe '.images_using_flash_per_year' do
    context 'when no images use flash' do
      let(:expected_data) do
        {
          '2017' => {
            with_flash: 0,
            flash_percentage: 0,
            without_flash: 1,
            without_flash_percentage: 100
          }
        }
      end

      it 'returns a value of 0' do
        expect(AgHarvestedExifMetadata.images_using_flash_per_year).to eq(expected_data)
      end
    end

    context 'when an image uses flash' do
      let!(:image) { AgHarvestedExifMetadata.create!(image: 1, aperture: 9.0, cameraModelRef: camera.id_local, dateYear: 2017.0, flashFired: 1, focalLength: 80.0, isoSpeedRating: 100.0, lensRef: lens.id_local, shutterSpeed: 2.0) }

      let(:expected_data) do
        {
          '2017' => {
            with_flash: 1,
            flash_percentage: 50.00,
            without_flash: 1,
            without_flash_percentage: 50.00
          }
        }
      end

      it 'returns the flash count' do
        expect(AgHarvestedExifMetadata.images_using_flash_per_year).to eq(expected_data)
      end
    end
  end

  describe '.image_count_using_flash' do
    context 'when no images use flash' do
      it 'returns 0' do
        expect(AgHarvestedExifMetadata.image_count_using_flash).to eq(0)
      end
    end

    context 'when one image uses flash' do
      let!(:image) { AgHarvestedExifMetadata.create!(image: 1, aperture: 9.0, cameraModelRef: camera.id_local, flashFired: 1, focalLength: 80.0, isoSpeedRating: 100.0, lensRef: lens.id_local, shutterSpeed: 2.0) }

      it 'returns the number of images using flash' do
        expect(AgHarvestedExifMetadata.image_count_using_flash).to eq(1)
      end
    end
  end
end
