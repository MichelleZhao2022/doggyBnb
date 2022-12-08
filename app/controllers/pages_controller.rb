# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @accommodations = Accommodation.all.map do |accommodation|
      {
        id: accommodation.id,
        city: accommodation.city,
        country: accommodation.country,
        price_cents: accommodation.price_cents,
        image: url_for(accommodation.default_image)
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @accommodations }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json do
        render json: { error: e.message }.to_json, status: 404
      end
    end
  end
end
