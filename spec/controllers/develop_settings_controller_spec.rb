require 'rails_helper'

RSpec.describe DevelopSettingsController, type: :controller do
  render_views

  describe '#crop_sizes' do
    it 'renders the crop_sizes template' do
      get :crop_sizes

      expect(response).to render_template :crop_sizes
    end
  end

  describe '#develop_steps' do
    it 'renders the develop_steps template' do
      get :develop_steps

      expect(response).to render_template :develop_steps
    end
  end

  describe '#adjustments' do
    it 'renders the adjustments template' do
      get :adjustments

      expect(response).to render_template :adjustments
    end
  end

  describe '#white_balances' do
    it 'renders the white_balances template' do
      get :white_balances

      expect(response).to render_template :white_balances
    end
  end
end
