# frozen_string_literal: true

module Api
  class SearchController < ApplicationController
    def index
      @accommodations = Accommodation.city(search_params[:city])
      respond_to do |format|
        format.html
        format.json do
          render json: @accommodation.as_json.merge({ images: @accommodation.images.map do |img|
                                                                { image: url_for(img) }
                                                              end })
        end
      end
    end
    
    private

    def search_params
      params.permit(:city, :name)
    end
  end
end