# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @accommodations = Accommodation.all
  end

  def show
    @accommodations = Accommodation.find(params[:id])
  end
end
