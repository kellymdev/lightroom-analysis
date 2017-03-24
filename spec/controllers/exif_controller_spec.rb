require 'rails_helper'

RSpec.describe ExifController, type: :controller do
  render_views

  describe '#apertures' do
    it 'renders the apertures template' do
      expect(response).to render_template :apertures
    end
  end

  describe '#focal_lengths' do
    it 'renders the focal_lengths template' do
      expect(response).to render_template :focal_lengths
    end
  end

  describe '#lenses' do
    it 'renders the lenses template' do
      expect(response).to render_template :lenses
    end
  end

  describe '#isos' do
    it 'renders the isos template' do
      expect(response).to render_template :isos
    end
  end

  describe '#shutterspeeds' do
    it 'renders the shutterspeeds template' do
      expect(response).to render_template :shutterspeeds
    end
  end

  describe '#cameras' do
    it 'renders the cameras template' do
      expect(response).to render_template :cameras
    end
  end

  describe '#isos_by_camera' do
    it 'renders the isos_by_camera template' do
      expect(response).to render_template :isos_by_camera
    end
  end
end
