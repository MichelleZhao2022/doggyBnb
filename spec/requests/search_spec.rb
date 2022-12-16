# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Search', type: :request do
  
  let(:accommodations) { create_list(:accommodation, 2) }
  describe 'GET /index' do
    it 'returns http success' do
      get api_search_index_path(accommodations)
      expect(response).to have_http_status(:success)
    end
  end
end
