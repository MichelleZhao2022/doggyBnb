# frozen_string_literal: true

module Api
  class SearchController < ApplicationController
    def index
      @accommodations = Accommodation.city(search_params[:city])
    end
    
    private

    def search_params
      params.permit(:city, :name)
    end
  end
end