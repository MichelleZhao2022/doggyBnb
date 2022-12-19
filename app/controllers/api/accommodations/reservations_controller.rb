# frozen_string_literal: true

module Api
  module Accommodations
    class ReservationsController < ApplicationController
      def new
        @accommodation = Accommodation.find(params[:accommodation_id])
        @reservation = @accommodation.reservations.new

        if @reservation.save
          binding.pry
          redirect_to api_accommodations_path
        end
      end

      private

      def new_reservation_params
        params.permit(:checkin_date, :checkout_date, :subtotal, :total)
      end

    end
  end
end