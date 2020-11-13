class BookingsController < ApplicationController
  def index
    render json: Booking.by_space(params[:rooms_number])
  end
end
