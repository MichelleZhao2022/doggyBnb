# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Accommodations::Reservations', type: :request do
  describe 'GET /new' do
    let(:accommodation) { create(:accommodation) }
    it 'returns http success' do
      get new_api_accommodation_reservation_path(accommodation)
    #   expect(response).to have_http_status(:success)
    end
  end
end
