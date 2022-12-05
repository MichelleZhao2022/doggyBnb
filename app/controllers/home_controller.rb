# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @accommodations = Accommodation.all
  end
end
