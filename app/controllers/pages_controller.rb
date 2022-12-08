# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @accommodations = Accommodation.all

    respond_to do |format|
      format.html
      format.json do
        render json: @accommodations.map { |accommodation|
                       accommodation.as_json.merge({ images: accommodation.images.map do |img|
                                                               { image: url_for(img) }
                                                             end })
                     }
      end
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json do
        render json: { error: e.message }.to_json, status: 404
      end
    end
  end

  def show
    @accommodations = Accommodation.find(params[:id])
  end
end
