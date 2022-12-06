# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @accommodations = Accommodation.all

    respond_to do |format|
      format.xml
      format.html
      format.json { render json: @accommodations }

      # format.json do
      #   render json: @accommodations.to_json, status: :ok
      # end
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json do
        render json: { error: e.message }.to_json, status: 404
      end
    end
  end
end
