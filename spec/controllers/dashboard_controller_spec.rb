require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  render_views

  describe '#index' do
    before do
      get :index
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end
  end
end
