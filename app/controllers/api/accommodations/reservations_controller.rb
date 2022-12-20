# frozen_string_literal: true

module Api
  module Accommodations
    class ReservationsController < ApplicationController
      def new
        @accommodation = Accommodation.find(params[:accommodation_id])
        @reservation = @accommodation.reservations.new(new_reservation_params)

        if @reservation.save
          # redirect_to accommodation_reservations_path, notice: "Reservation was successfully created." 
        else
          format.json do
            render json: { error: e.message }.to_json, status: 404
          end
        end
      end

      def index
        @accommodation = Accommodation.find(params[:accommodation_id])
        @reservation = @accommodation.reservations
        respond_to do |format|
          format.html
          format.json do
            render json: @reservation.as_json
          end
        end
      end

      private

      def new_reservation_params
        params.require(:reservation).permit(:checkin_date, :checkout_date, :subtotal, :total)
      end

    end
  end
end