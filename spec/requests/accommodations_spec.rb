# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Accommodations', type: :request do
  describe 'GET /index' do
    # let!(:accommodations) { create_list(:accommodation, 2) }
    it 'returns http success' do
      get api_accommodations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:accommodation) { create(:accommodation) }
    it 'returns http success' do
      get api_accommodation_path(accommodation)
      expect(response).to have_http_status(:success)
    end
  end
end
